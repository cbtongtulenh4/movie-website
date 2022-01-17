package com.website.movie.events;

import com.website.movie.persistence.entity.UserEntity;
import org.springframework.context.ApplicationEvent;

import java.util.Locale;

public class OnRegistrationCompleteEvent extends ApplicationEvent {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */


    // url of Application
    private String appUrl;
    // get locale in request message (from client), to display form language friendly of your customers
    private Locale locale;
    private UserEntity user;

    public OnRegistrationCompleteEvent(final UserEntity user, Locale locale, String appUrl) {
        super(user);

        this.user = user;
        this.locale = locale;
        this.appUrl = appUrl;
    }

    public String getAppUrl() {
        return appUrl;
    }

    public Locale getLocale() {
        return locale;
    }

    public UserEntity getUser() {
        return user;
    }
}
