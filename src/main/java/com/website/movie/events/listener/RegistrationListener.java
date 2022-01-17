package com.website.movie.events.listener;


import com.website.movie.events.OnRegistrationCompleteEvent;
import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.service.IUserService;
import com.website.movie.service.IVerificationTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
@PropertySource({
        "classpath:message_en.properties"
})
public class RegistrationListener implements ApplicationListener<OnRegistrationCompleteEvent> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */


    @Autowired
    private IVerificationTokenService vTokenService;

    @Autowired
    private IUserService userService;

    @Autowired
    private MessageSource messages;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private Environment env;

    @Override
    public void onApplicationEvent(final OnRegistrationCompleteEvent event) {
        this.confirmRegistration(event);
    }

    private void confirmRegistration(final OnRegistrationCompleteEvent event){
        final UserEntity user = userService.findByEmail(event.getUser().getEmail());
        // UUID - Universally Unique Identifier - Globally Unique Identifier
        final String token = UUID.randomUUID().toString();
        vTokenService.createVerificationTokenForUser(user, token);

        SimpleMailMessage email = constructEmailMessage(event, user, token);
        mailSender.send(email);
    }

    private SimpleMailMessage constructEmailMessage(
            final OnRegistrationCompleteEvent event, final UserEntity user, final String token)
    {
        // email address of recipient
        final String recipientAddress = user.getEmail();
        final String subject = "Registration Confirmation";
        final String confirmationUrl = event.getAppUrl() + "/registrationConfirm/?token=" + token;
        final String message = messages.getMessage(
                "message.regSuccLink",
                null,
                "You registered successfully. To confirm your registration, please click on the below link.",
                event.getLocale()
        );
        final SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientAddress);
        email.setSubject(subject);
        email.setText(message + "\r\n" + confirmationUrl);
        email.setFrom(env.getProperty("support.email"));
        return email;
    }

}
