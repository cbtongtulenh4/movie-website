package com.website.movie.interceptor;

import com.website.movie.utils.InterceptorUtil;
import com.website.movie.utils.SessionUtil;
import lombok.SneakyThrows;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionTimerInterceptor implements HandlerInterceptor {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 24/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    HttpSession session;

    private static Logger LOGGER = LoggerFactory.getLogger(SessionTimerInterceptor.class);

    private static final long MAX_INACTIVE_SESSION_TIME = 5 * 10000;

    @SneakyThrows
    @Override
    public boolean preHandle(final HttpServletRequest request, final HttpServletResponse response, final Object handler){
        LOGGER.info("Pre handle method - check handling start time");
        long startTime = System.currentTimeMillis();
        SessionUtil.getInstance().putValue(request, "executionTime", startTime);
        if(InterceptorUtil.isUserLogged(request)){
            session = request.getSession();
            long lastAccessedTime = session.getLastAccessedTime();
            LOGGER.info("Time since last request in this session: {}ms",
                    startTime - lastAccessedTime);
            if (startTime - lastAccessedTime > MAX_INACTIVE_SESSION_TIME){
                LOGGER.warn("Logging out, due to inactive session");
            //    InterceptorUtil.clearContext(request);
                request.logout();
                response.sendRedirect("/login?lang=" + request.getLocale().getLanguage());
            }

        }
        return true;
    }

    @Override
    public void postHandle(final HttpServletRequest request, final HttpServletResponse response, final Object handler, final ModelAndView mav){
        LOGGER.info("Post handle method - check execution time of handling");
        long startTime = (long) SessionUtil.getInstance().getValue(request, "executionTime");
        LOGGER.info("Execution time for handling the request was: {}ms", System.currentTimeMillis() - startTime);
    }

}
