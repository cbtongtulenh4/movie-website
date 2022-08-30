package com.website.movie.web.api.web;

import com.website.movie.constant.MessageConstants;
import com.website.movie.events.OnVerificationTokenCompleteEvent;
import com.website.movie.helper.error.UserAlreadyExistException;
import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.service.IUserService;
import com.website.movie.service.IVerificationTokenService;
import com.website.movie.web.dto.MailDto;
import com.website.movie.web.dto.MessageDto;
import com.website.movie.web.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

@RestController(value = "RegistrationAPI")
public class RegistrationRestController {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 20/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private IUserService userService;

    @Autowired
    private IVerificationTokenService verificationTokenService;

    @Autowired
    private ApplicationEventPublisher eventPublisher;

    @Autowired
    private MessageSource messages;

    @PostMapping(value = "/api/registration")
    public MessageDto registrationUserAccount(
            @RequestBody final UserDto userDto,
            final HttpServletRequest request)
    {
        try {
            UserEntity registered = userService.registerNewUserAccount(userDto);
            final String appUrl = getAppUrl(request);
            final Locale locale = request.getLocale();
            final MailDto mailDto = new MailDto("registrationConfirm?", locale);
            mailDto.constructRegistrationMail();
            eventPublisher.publishEvent(new OnVerificationTokenCompleteEvent(registered, appUrl, mailDto));
        }catch (final UserAlreadyExistException uaeEx){
            String message = messages.getMessage("message.regError", null, request.getLocale());
            MessageDto msg = new MessageDto(MessageConstants.DANGER, message);
            return msg;
        }catch (final Exception ex){
            ex.printStackTrace();
            userService.deleteUserAccount(userDto.getEmail());
            return new MessageDto(MessageConstants.DANGER, "Unable to register user");
        }
        String message = messages.getMessage("message.checkEmail", null, request.getLocale());
        MessageDto msg = new MessageDto(MessageConstants.INFO, message);
        return msg;
    }

    private String getAppUrl(HttpServletRequest request){
        return "http://" + request.getServerName() +
                ":" + request.getServerPort() + request.getContextPath();
    }

}
