package com.website.movie.interceptor;

import com.website.movie.security.MyUserPrincipal;
import com.website.movie.security.custom.ExpressionUrlAuthorization;
import com.website.movie.security.custom.RequestMatcherRegistry;
import com.website.movie.utils.InterceptorUtil;
import com.website.movie.utils.MessageUtil;
import com.website.movie.utils.SessionUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserInterceptor implements HandlerInterceptor {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    ApplicationContext applicationContext;

//      @Autowired
//      RequestMatcherRegistry authorizationRegistry;

    private static Logger LOGGER = LoggerFactory.getLogger(UserInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception{
        final String targetUrl = getTargetUrl(request);
        if (!targetUrl.contains("login")){
            final RequestMatcherRegistry auth = getAuthorizationRegistry();
            final MyUserPrincipal user = InterceptorUtil.getUserLogin(request);
            if(InterceptorUtil.isUserLogged(request)){
                return checkPermission(auth, user, targetUrl, "NotPermission", request, response);
            }else{
                return checkPermission(auth, user, targetUrl, "NotLogin", request, response);
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView model) throws Exception {

    }

    private String getTargetUrl(HttpServletRequest request){
        try {
            String[] splitURI = request.getRequestURI().split("/");
            return splitURI[splitURI.length - 1];
        }catch (Exception ex){
            return null;
        }
    }

    private RequestMatcherRegistry getAuthorizationRegistry(){
//        try {
//            return new AnnotationConfigApplicationContext(WebConfig.class).getBean(RequestMatcherRegistry.class);
//        }catch (NoUniqueBeanDefinitionException ex){
//            LOGGER.error(ex.getLocalizedMessage(), ex);
//            return null;
//        }
        RequestMatcherRegistry registry = new RequestMatcherRegistry();
        registry.antMatchers("/admin").access("ADMIN");
        return registry;
    }

    private boolean checkPermission(
            final RequestMatcherRegistry auth,
            final MyUserPrincipal myUser,
            final String targetUrl,
            final String message,
            final HttpServletRequest request,
            final HttpServletResponse response) {
        boolean check = (myUser != null) ?
                ExpressionUrlAuthorization.hasPermission(auth, myUser, targetUrl) :
                ExpressionUrlAuthorization.hasPermission(auth, targetUrl);
        try {
            if (!check) {
                request.setAttribute("message", MessageUtil.getMessage("message.user." + message));
                response.sendRedirect(request.getContextPath() + "/login?lang=" + request.getLocale().getLanguage());
            }
        } catch(IOException e){
            e.printStackTrace();
        }
        return check;
    }
}
