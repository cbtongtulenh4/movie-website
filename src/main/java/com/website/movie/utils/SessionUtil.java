package com.website.movie.utils;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;

public class SessionUtil {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static SessionUtil sessionUtil = null;

    public static SessionUtil getInstance(){
        if (sessionUtil == null){
            sessionUtil = new SessionUtil();
        }
        return sessionUtil;
    }

    public void putValue(final HttpServletRequest request, final String key, final Object value){
        AssertUtil.notNull(request, "Request cannot be null");
        request.getSession().setAttribute(key, value);
    }

    public Object getValue(final HttpServletRequest request, final String key){
        AssertUtil.notNull(request, "Request cannot be null");
        return request.getSession().getAttribute(key);
    }

    public void removeValue(final HttpServletRequest request, final String key){
        AssertUtil.notNull(request, "Request cannot be null");
        request.getSession().removeAttribute(key);
    }

    public Object getAndRemoveValue(final HttpServletRequest request, final String key){
        Object obj = getValue(request, key);
        removeValue(request, key);
        return obj;
    }

    public Optional<String> getPreviousPageByRequest(HttpServletRequest request){
        return Optional.ofNullable(request.getHeader("Referer")).map(requestURL -> "redirect:" + requestURL);
    }

    public void savePreviousPageByRequest(HttpServletRequest request){
        putValue(request, "PreviousPage", getPreviousPageByRequest(request).orElse("redirect:/"));
    }

    public String getAndRemovePreviousPage(HttpServletRequest request){
        String url = (String) getValue(request, "PreviousPage");
        request.getSession().removeAttribute("PreviousPage");
        return url;
    }

    public String getPreviousPage(HttpServletRequest request){
        Object rs = request.getSession().getAttribute("PreviousPage");
        if (rs == null) return "redirect:/";
        return rs.toString();
    }


}
