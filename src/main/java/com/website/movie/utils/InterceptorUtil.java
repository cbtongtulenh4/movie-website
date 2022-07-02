package com.website.movie.utils;

import com.website.movie.security.MyUserPrincipal;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
            return SessionUtil.getInstance().getValue(request, "USERMODEL") != null;
        }catch (Exception ex){
            return false;
        }
    }

    public static MyUserPrincipal getUserLogin(final HttpServletRequest request){
        return (MyUserPrincipal) request.getSession().getAttribute("USERMODEL");
    }

    public static void clearContext(final HttpServletRequest request){
        SessionUtil.getInstance().removeValue(request, "USERMODEL");
    }

}
