package com.website.movie.web.api.web;

import com.website.movie.constant.MessageConstants;
import com.website.movie.events.OnVerificationTokenCompleteEvent;
import com.website.movie.helper.error.MailAuthenticationException;
import com.website.movie.helper.error.UserAlreadyExistException;
import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.persistence.entity.VerificationTokenEntity;
import com.website.movie.security.MyUserPrincipal;
import com.website.movie.service.IUserService;
import com.website.movie.service.IVerificationTokenService;
import com.website.movie.utils.MessageUtil;
import com.website.movie.utils.SessionUtil;
import com.website.movie.web.dto.ChangePasswordDto;
import com.website.movie.web.dto.MailDto;
import com.website.movie.web.dto.MessageDto;
import com.website.movie.web.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Calendar;
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


    @PostMapping(value = "/api/registration/confirm")
    public MessageDto ConfirmRegistration(
            final HttpServletRequest request,
            @RequestParam("token") final String token)
    {
        final Locale locale = request.getLocale();
        final VerificationTokenEntity verificationToken = verificationTokenService.getVerificationToken(token);
        if(verificationToken == null){
            final String message = messages.getMessage("auth.message.invalidToken", null, locale);
            MessageDto msg = new MessageDto(MessageConstants.DANGER, message);
            return msg;
        }

        final Calendar cal = Calendar.getInstance();
        if(verificationToken.getExpiryDate().getTime() - cal.getTime().getTime() <= 0){
            String message = messages.getMessage("auth.message.expired", null, locale);
            MessageDto msg = new MessageDto(MessageConstants.DANGER, message);
//            mav.addObject("expired", true);
//            mav.addObject("token", token);
            return msg;
        }
        final UserEntity user = verificationToken.getUser();
        user.setEnable(true);
        userService.saveRegisteredUser(user);

        verificationTokenService.deleteAllByUserId(user.getId());
        MessageDto msg = new MessageDto(
                MessageConstants.SUCCESS,
                messages.getMessage("message.accountVerified", null, locale));
        return msg;
    }

    @PostMapping(value = "/api/registration/resendToken")
    public MessageDto resendRegistrationToken(
            @RequestParam(value = "token") final String expiredToken,
            final HttpServletRequest request)
    {
        VerificationTokenEntity vTokenEntity = verificationTokenService.findByToken(expiredToken);
        UserEntity user = vTokenEntity.getUser();
        final Locale locale = request.getLocale();
        try {
            MailDto mailDto = new MailDto( "registrationConfirm?", locale);
            mailDto.constructResendMail();
            eventPublisher.publishEvent(new OnVerificationTokenCompleteEvent(user, getAppUrl(request), mailDto));
        }catch (final MailAuthenticationException ex){
//            LOGGER.debug("MailAuthenticationException", ex);
            return new MessageDto(
                    MessageConstants.DANGER,
                    messages.getMessage("message.emailError", null, "Can't Send Email", locale)
            );
        }catch (final Exception ex){
//            LOGGER.debug(ex.getLocalizedMessage(), ex);
            return new MessageDto(MessageConstants.DANGER, ex.getLocalizedMessage());
        }
        verificationTokenService.deleteVerificationTokenEntity(vTokenEntity);
        return new MessageDto(
                MessageConstants.INFO,
                messages.getMessage("message.resendToken", null, "We will send an email with a new registration token to your email account", locale)
        );
    }

    @PostMapping(value="/api/registration/changePassword")
    public MessageDto changePassword(
            @RequestBody @Valid ChangePasswordDto changePassword,
            final BindingResult result,
            HttpServletRequest request
    ){
//        LOGGER.info("Change Password");
        if (result.hasErrors()){
            return new MessageDto(
                    MessageConstants.WARNING,
                    result.getAllErrors().get(0).getDefaultMessage()
            );
        }
        MyUserPrincipal myUser = (MyUserPrincipal) SessionUtil.getInstance().getValue(request, "USER_MODEL");
        if (!userService.validChangePassword(changePassword.getPassRaw(), myUser.getPassword())){
            return new MessageDto(
                    MessageConstants.WARNING,
                    MessageUtil.getMessage("message.changePassword.invalidRaw")
            );
        }
        try {
            myUser.setUser(userService.changeUserPassword(myUser.getUser(), changePassword.getPassNew()));
            SessionUtil.getInstance().putValue(request, "USER_MODEL", myUser);
        }catch (Exception ex){
            return new MessageDto(
                    MessageConstants.DANGER,
                    MessageUtil.getMessage("message.changePassword.Failure")
            );
        }

        return new MessageDto(
                MessageConstants.SUCCESS,
                MessageUtil.getMessage("message.changePassword.Suc")
        );
    }


    private String getAppUrl(HttpServletRequest request){
        return "http://" + request.getServerName() +
                ":" + request.getServerPort() + request.getContextPath();
    }

}
