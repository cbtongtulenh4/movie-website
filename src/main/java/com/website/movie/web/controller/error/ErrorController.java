package com.website.movie.web.controller.error;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

@Controller(value = "ResolveErrorController")
public class ErrorController {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 25/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    MessageSource messages;

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public ModelAndView renderErrorPage(final HttpServletRequest request,final HttpServletResponse response){
        ModelAndView errorPage = new ModelAndView("error/errorPage");
        String errorMsg = "";
        Locale locale = request.getLocale();
//        int httpError = getErrorCode(response);
        int httpError = getErrorCode(request);
        switch (httpError){
            case 400:
                errorMsg = messages.getMessage("message.error.400", null, locale);
                break;
            case 401:
                errorMsg = messages.getMessage("message.error.401", null, locale);
                break;
            case 404:
                errorMsg = messages.getMessage("message.error.404", null, locale);
                break;
            case 405:
                errorMsg = messages.getMessage("message.error.405", null, locale);
                break;
            case 406:
                errorMsg = messages.getMessage("message.error.406", null, locale);
                break;
            default:
                errorMsg =  messages.getMessage("message.error", null, locale);
        }
        errorPage.addObject("errorMsg", errorMsg);
        return errorPage;
    }

    private int getErrorCode(final HttpServletRequest request){
        Object errorCode = request.getAttribute("javax.servlet.error.status_code");
        if (errorCode == null){
            errorCode = 0;
        }
        return (int) errorCode;
    }
//    private int getErrorCode(final HttpServletResponse response){
//        return response.getStatus();
//    }




}
