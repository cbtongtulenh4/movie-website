package com.website.movie.config;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.drive.Drive;
import com.website.movie.events.custom.EventListener;
import com.website.movie.events.custom.EventMultiCaster;
import com.website.movie.events.custom.SimpleEventMultiCaster;
import com.website.movie.interceptor.SessionTimerInterceptor;
import com.website.movie.interceptor.UserInterceptor;
import com.website.movie.security.custom.RequestMatcherRegistry;
import com.website.movie.utils.EmailUtil;
import nz.net.ultraq.thymeleaf.layoutdialect.LayoutDialect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.*;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.thymeleaf.spring5.ISpringTemplateEngine;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.thymeleaf.spring5.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.spring5.view.ThymeleafViewResolver;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ITemplateResolver;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Objects;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {
        "com.website.movie"
})
@PropertySource({
        "classpath:application.properties"
})
public class WebConfig implements WebMvcConfigurer, ApplicationContextAware {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private Environment env;

    ApplicationContext applicationContext;

    @Autowired
    private RequestMappingHandlerAdapter requestMappingHandlerAdapter;

    @Autowired
    private GoogleCredential googleCredential;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    // hiding ModelAttribute variables from appearing in URL
    @PostConstruct
    public void init() {
        requestMappingHandlerAdapter.setIgnoreDefaultModelOnRedirect(true);
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
        engine.addDialect(new LayoutDialect());
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
        resolver.setCharacterEncoding("UTF-8");
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

    @Override
    public void addInterceptors(final InterceptorRegistry registry){
        registry.addInterceptor(new SessionTimerInterceptor());
        registry.addInterceptor(new UserInterceptor());
    }

    @Bean
    @Autowired(required = false)
    public RequestMatcherRegistry authorizationRegistry(){
        RequestMatcherRegistry registry = new RequestMatcherRegistry();
        registry.antMatchers("/admin").access("ADMIN");
        return registry;
    }

    /*
    Google Drive Api setting
     */

    @Bean
    public Drive getDrive() throws GeneralSecurityException, IOException {
        final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        return new Drive.Builder(
                HTTP_TRANSPORT,
                JacksonFactory.getDefaultInstance(),
                googleCredential
        ).build();
    }

    @Bean
    public GoogleCredential googleCredential() throws URISyntaxException, GeneralSecurityException, IOException {
//        URL resource = WebConfig.class.getResource(env.getProperty("google.drive.api.service.account_key"));
//        if(resource == null){
//            throw new IllegalArgumentException("File not found");
//        }
//        java.io.File key = Paths.get(resource.toURI()).toFile();
        File key = new File(Objects.requireNonNull(WebConfig.class.getClassLoader().getResource("moviewebsite-352718-7ea337f38c31.p12")).getPath());
        Collection<String> elenco = new ArrayList<>();
        elenco.add("https://www.googleapis.com/auth/drive");
        HttpTransport httpTransport = new NetHttpTransport();
        JacksonFactory jacksonFactory = new JacksonFactory();
        return new GoogleCredential.Builder()
                .setTransport(httpTransport)
                .setJsonFactory(jacksonFactory)
                .setServiceAccountId(env.getProperty("google.drive.api.service.account_email"))
                .setServiceAccountScopes(elenco)
                .setServiceAccountPrivateKeyFromP12File(key)
                .build();
    }

    /*
        Config file upload commons - Multipart file
     */

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver()
    {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(20848820);
        return multipartResolver;
    }

}