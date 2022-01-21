package com.website.movie.config;

import com.website.movie.events.custom.EventListener;
import com.website.movie.events.custom.EventMultiCaster;
import com.website.movie.events.custom.SimpleEventMultiCaster;
import com.website.movie.events.listener.VerificationTokenListener;
import com.website.movie.utils.EmailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Description;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.thymeleaf.spring5.ISpringTemplateEngine;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.thymeleaf.spring5.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.spring5.view.ThymeleafViewResolver;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ITemplateResolver;

import java.util.*;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {
        "com.website.movie"
})
public class WebConfig implements WebMvcConfigurer, ApplicationContextAware {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */


    ApplicationContext applicationContext;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    @Override
    public void addViewControllers(final ViewControllerRegistry registry){
        registry.addViewController("/").setViewName("web/home");
    }

    @Bean
    @Description("set ViewResolver for html page")
    // indicate page form to display to screen UI
    public ViewResolver htmlViewResolver() {
        ThymeleafViewResolver resolver = new ThymeleafViewResolver();
        resolver.setTemplateEngine(templateEngine(htmlTemplateResolver()));
        resolver.setContentType("text/html");
        resolver.setCharacterEncoding("UTF-8");
        // build a custom ArrayUtil, use to get String[]
//        resolver.setViewNames(ArrayUtil.array("*.html"));
        return resolver;
    }

    private ISpringTemplateEngine templateEngine(ITemplateResolver templateResolver) {
        SpringTemplateEngine engine = new SpringTemplateEngine();
        engine.setTemplateResolver(templateResolver);
        engine.setTemplateEngineMessageSource(messageSourceThymeleaf());
        return engine;
    }

    // resource resolution
    private ITemplateResolver htmlTemplateResolver() {
        SpringResourceTemplateResolver resolver = new SpringResourceTemplateResolver();
        resolver.setApplicationContext(applicationContext);
        // storage location of files UI
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".html");
        //turn off stored data from requests UI
        resolver.setCacheable(false);
        resolver.setTemplateMode(TemplateMode.HTML);
        return resolver;
    }

    private ResourceBundleMessageSource messageSourceThymeleaf() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasename("message_en");
        return messageSource;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry){
        registry.addResourceHandler("/template/**")
                .addResourceLocations("/template/");
        registry.addResourceHandler("/resource/**")
                .addResourceLocations("/", "/resource/");
    }

    @Bean
    public JavaMailSender mailSender(){
        return EmailUtil.constructMailSender();
    }

//    @Bean
//    // Create this bean in container, to ApplicationEventPublisher call
//    public VerificationTokenListener registrationListener(){
//        return new VerificationTokenListener();
//    }


    @Bean
    public ResourceBundleMessageSource messageSource(){
        ResourceBundleMessageSource source = new ResourceBundleMessageSource();
        source.setBasenames("message_en");
        source.setUseCodeAsDefaultMessage(true);
        return source;
    }


    @Bean
    @Autowired(required = false)
    public EventMultiCaster eventMultiCaster(List<EventListener> listeners){
        EventMultiCaster eventPublisher = new SimpleEventMultiCaster();
        if(listeners != null){
            listeners.forEach(eventPublisher::addEventListener);
        }
        return eventPublisher;
    }


}
