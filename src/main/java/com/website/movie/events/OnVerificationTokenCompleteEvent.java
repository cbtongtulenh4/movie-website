package com.website.movie.events;

import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.web.dto.MailDto;
import org.springframework.context.ApplicationEvent;

import java.util.Locale;

public class OnVerificationTokenCompleteEvent extends ApplicationEvent {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */


    // url of Application
    private String appUrl;
    // action
    private MailDto mailDto;

    private UserEntity user;

    public OnVerificationTokenCompleteEvent(final UserEntity user, String appUrl, MailDto mailDto) {
        super(user);

        this.user = user;
        this.appUrl = appUrl;
        this.mailDto = mailDto;
    }

    public String getAppUrl() {
        return appUrl;
    }

    public UserEntity getUser() {
        return user;
    }

    public MailDto getMailDto() {
        return mailDto;
    }
}
