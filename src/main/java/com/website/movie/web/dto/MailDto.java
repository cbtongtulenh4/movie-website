package com.website.movie.web.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;

import java.util.Locale;

/**
 * MailDto: execute actions change attribute when send mail
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class MailDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 20/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    MessageSource messages;

    // target address for action
    private String target;
    // name button click
    private String subject;
    //
    private String message;
    // get locale in request message (from client), to display form language friendly of your customers
    private Locale locale;

    public MailDto(final String target, final Locale locale){
        this.target = target;
        this.locale = locale;
    }

    public void constructRegistrationMail(){
//        this.subject = messages.getMessage("email.subject.sendMail", null,"Registration Confirm", locale);
//        this.message = messages.getMessage("email.message.sendMail", null,"You registered successfully", locale);
        this.subject = "Registration Confirm";
        this.message = "You registered successfully";
    }

    public void constructResetPasswordMail(){
        this.subject = messages.getMessage("email.subject.resetPassword", null, locale);
        this.message = messages.getMessage("email.message.resetPassword", null, locale);
    }

    public void constructChangePasswordMail(){
        this.subject = messages.getMessage("email.subject.changePassword", null, locale);
        this.message = messages.getMessage("email.message.changePassword", null, locale);
    }

}
