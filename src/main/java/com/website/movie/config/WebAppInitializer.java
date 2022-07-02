package com.website.movie.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.ServletRegistration;

public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{ DataConfig.class };
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{WebConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

    // Way 1
    @Override
    public void customizeRegistration(ServletRegistration.Dynamic registration){
        registration.setInitParameter("throwExceptionIfNoHandlerFound", "true");
    }

    // Way 2
//    @Override
//    protected DispatcherServlet createDispatcherServlet(WebApplicationContext servletAppContext){
//        final DispatcherServlet dispatcherServlet = (DispatcherServlet) super.createDispatcherServlet(servletAppContext);
//        dispatcherServlet.setThrowExceptionIfNoHandlerFound(true);
//        return dispatcherServlet;
//    }

}
