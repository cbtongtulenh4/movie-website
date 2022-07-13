package com.website.movie.utils;

import com.website.movie.security.MyUserPrincipal;

import javax.servlet.http.HttpServletRequest;

public class InterceptorUtil {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 25/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

   // private static Logger LOGGER = LoggerFactory.getLogger()


    public static boolean isUserLogged(final HttpServletRequest request){
        try{
            return SessionUtil.getInstance().getValue(request, "USER_MODEL") != null;
        }catch (Exception ex){
            return false;
        }
    }

    public static MyUserPrincipal getUserLogin(final HttpServletRequest request){
        return (MyUserPrincipal) request.getSession().getAttribute("USER_MODEL");
    }

    public static void clearContext(final HttpServletRequest request){
        SessionUtil.getInstance().removeValue(request, "USER_MODEL");
    }

}
