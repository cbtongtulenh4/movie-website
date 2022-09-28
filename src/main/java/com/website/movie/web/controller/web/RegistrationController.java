package com.website.movie.web.controller.web;

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
import com.website.movie.utils.PasswordUtil;
import com.website.movie.utils.SessionUtil;
import com.website.movie.web.dto.ChangePasswordDto;
import com.website.movie.web.dto.MailDto;
import com.website.movie.web.dto.MessageDto;
import com.website.movie.web.dto.UserRegistrationDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Calendar;
import java.util.Locale;

@Controller(value = "RegistrationControllerOfWeb")
public class RegistrationController {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private final Logger LOGGER = LoggerFactory.getLogger(getClass());


    @Autowired
    private IUserService userService;

    @Autowired
    private IVerificationTokenService verificationTokenService;

    @Autowired
    private ApplicationEventPublisher eventPublisher;

    @Autowired
    private MessageSource messages;

    @RequestMapping(value = "/badUser")
    public String getBadUser(){
        return "badUser";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public @ResponseBody MessageDto registrationUserAccount(
            @RequestBody @Valid final UserRegistrationDto userRegistrationDto,
            final BindingResult result,
            final HttpServletRequest request)
    {
        LOGGER.debug("Registering user account with information: {}", userRegistrationDto);

        // check error valid
//        if(result.hasErrors()){
//            throw new InvalidDataException(result);
////            throw new MethodArgumentNotValidException(new MethodParameter(
////                    this.getClass().getDeclaredMethod("registrationUserAccount", UserDto.class), 0), result);
//        }

//        String targetURL = SessionUtil.getInstance().getPreviousPageByRequest(request).orElse("redirect:/");
//        ModelAndView mav = new ModelAndView(targetURL, "user", userDto);
        try {
            UserEntity registered = userService.registerNewUserAccount(userRegistrationDto);
            final String appUrl = getAppUrl(request);
            final Locale locale = request.getLocale();
            final MailDto mailDto = new MailDto("registrationConfirm?", locale);
            mailDto.constructRegistrationMail();
            eventPublisher.publishEvent(new OnVerificationTokenCompleteEvent(registered, appUrl, mailDto));
        }catch (final UserAlreadyExistException uaeEx){
            String message = messages.getMessage("message.regError", null, request.getLocale());
            MessageDto msg = new MessageDto(MessageConstants.DANGER, message);
//            mav.addObject("message", msg);
//            return mav;
            return msg;
        }catch (final Exception ex){
            LOGGER.warn("Unable to register user", ex);
            ex.printStackTrace();
            userService.deleteUserAccount(userRegistrationDto.getEmail());
//            mav.addObject(
//                    "message",
//                    new MessageDto(MessageConstants.DANGER, "Unable to register user")
//            );
            return new MessageDto(MessageConstants.DANGER, "Unable to register user");
        }
        String message = messages.getMessage("message.checkEmail", null, request.getLocale());
        MessageDto msg = new MessageDto(MessageConstants.INFO, message);
//        mav.addObject("message", msg);
//        SessionUtil.getInstance().savePreviousPageByRequest(request);
        return msg;
    }

    @RequestMapping(value = "/registrationConfirm", method = RequestMethod.GET)
    public ModelAndView ConfirmRegistration(
            final HttpServletRequest request,
            final UserRegistrationDto userRegistrationDto,
            final Model model,
            @RequestParam("token") final String token)
    {
        final Locale locale = request.getLocale();
//        String targetURL = SessionUtil.getInstance().getPreviousPage(request);
        ModelAndView mav = new ModelAndView("web/home");
        final VerificationTokenEntity verificationToken = verificationTokenService.getVerificationToken(token);
        if(verificationToken == null){
            final String message = messages.getMessage("auth.message.invalidToken", null, locale);
            MessageDto msg = new MessageDto(MessageConstants.DANGER, message);
            mav.addObject("message", msg);
            return mav;
        }

        final Calendar cal = Calendar.getInstance();
        if(verificationToken.getExpiryDate().getTime() - cal.getTime().getTime() <= 0){
            String message = messages.getMessage("auth.message.expired", null, locale);
            MessageDto msg = new MessageDto(MessageConstants.DANGER, message);
            mav.addObject("expired", true);
            mav.addObject("token", token);
            mav.addObject("message", msg);
            return mav;
        }

        final UserEntity user = verificationToken.getUser();
        user.setEnable(true);
        userService.saveRegisteredUser(user);
        MessageDto msg = new MessageDto(
                MessageConstants.DANGER,
                messages.getMessage("message.accountVerified", null, locale));
        mav.addObject("message", msg);
        return mav;
    }

    @RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
    public String resetPassword(
            @RequestParam(value = "username")final String username,
            final Model model,
            final HttpServletRequest request
    ){
        UserEntity user = userService.findByUsername(username);
        final Locale locale = request.getLocale();
        if(user == null){
            MessageDto msg = new MessageDto(
                    MessageConstants.DANGER,
                    messages.getMessage("message.userNotFound", null, locale)
            );
            model.addAttribute("message", msg);
            return "redirect:/login?lang=" + locale.getLanguage();
        }
        try {
            final String newPassword = PasswordUtil.getPassword(8);
            final String target = "savePassword?newPassword=" + newPassword;
            MailDto mailDto = new MailDto(target + "&", locale);
            mailDto.constructResetPasswordMail(newPassword);
            eventPublisher.publishEvent(new OnVerificationTokenCompleteEvent(user, getAppUrl(request), mailDto));
        }catch (final MailAuthenticationException ex){
            LOGGER.debug("MailAuthenticationException", ex);
            MessageDto msg = new MessageDto(
                    MessageConstants.DANGER,
                    messages.getMessage("message.emailError", null, "Can't Send Email", locale)
            );
            model.addAttribute("message", msg);
            return "redirect:/login?lang=" + locale.getLanguage();
        }catch (final Exception ex){
            LOGGER.debug(ex.getLocalizedMessage(), ex);
            MessageDto msg = new MessageDto(
                    MessageConstants.DANGER,
                    ex.getLocalizedMessage()
            );
            model.addAttribute("message", msg);
            return "redirect:/login?lang=" + locale.getLanguage();
        }
        MessageDto msg = new MessageDto(
                MessageConstants.INFO,
                messages.getMessage("message.resetPasswordEmail", null, "You should receive an Password Reset Email shortly", locale)
        );
        model.addAttribute("message", msg);
        return "redirect:/login?lang=" + locale.getLanguage();
    }

    @RequestMapping(value = "/savePassword", method = RequestMethod.GET)
    public String savePassword(
            @RequestParam(value = "newPassword") final String newPassword,
            @RequestParam(value = "token") final String token,
            final Model model,
            HttpServletRequest request)
    {
        VerificationTokenEntity vTokenEntity = verificationTokenService.findByToken(token);
        String statusToken = verificationTokenService.validateVerificationToken(vTokenEntity);
        if(statusToken != null){
            final String message = messages.getMessage("message.resetPasswordEmail." + statusToken, null, request.getLocale());
            MessageDto msg = new MessageDto(
                    MessageConstants.DANGER,
                    message
            );
            model.addAttribute("message", msg);
            return "redirect:/login?lang=" + request.getLocale().getLanguage();
        }
        UserEntity user = vTokenEntity.getUser();
        userService.changeUserPassword(user, newPassword);
        MessageDto msg = new MessageDto(
                MessageConstants.SUCCESS,
                messages.getMessage("message.resetPasswordSuc", null, request.getLocale())
        );
        model.addAttribute("message", msg);
        return "redirect:/login?lang=" + request.getLocale().getLanguage();
    }


    /**
     * valid password check in client-side
     * @param changePassword
     * @return
     */
    @PostMapping(value="/changePassword")
    public @ResponseBody MessageDto changePassword(
            @RequestBody @Valid ChangePasswordDto changePassword,
            final BindingResult result,
            HttpServletRequest request
    ){
        LOGGER.info("Change Password");
        if (result.hasErrors()){
            return new MessageDto(
                    MessageConstants.WARNING,
                    result.getAllErrors().get(0).getDefaultMessage()
            );
        }
        MyUserPrincipal myUser = (MyUserPrincipal)SessionUtil.getInstance().getValue(request, "USER_MODEL");
        ModelAndView mav = new ModelAndView("redirect:/userprofile");
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


    @RequestMapping(value = "/resendRegistrationToken", method = RequestMethod.POST)
    public String resendRegistrationToken(
        @RequestParam(value = "token") final String expiredToken,
        final Model model,
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
            LOGGER.debug("MailAuthenticationException", ex);
            MessageDto msg = new MessageDto(
                    MessageConstants.DANGER,
                    messages.getMessage("message.emailError", null, "Can't Send Email", locale)
            );
            model.addAttribute("message", msg);
            return "redirect:/login?lang=" + locale.getLanguage();
        }catch (final Exception ex){
            LOGGER.debug(ex.getLocalizedMessage(), ex);
            MessageDto msg = new MessageDto(
                    MessageConstants.DANGER,
                    ex.getLocalizedMessage()
            );
            model.addAttribute("message", msg);
            return "redirect:/login?lang=" + locale.getLanguage();
        }
        MessageDto msg = new MessageDto(
                MessageConstants.INFO,
                messages.getMessage("message.resendToken", null, "We will send an email with a new registration token to your email account", locale)
        );
        model.addAttribute("message", msg);
        return "redirect:/login?lang=" + locale.getLanguage();
    }


    @RequestMapping(value = "/test", method = RequestMethod.POST)
    public String checkTest(
            @ModelAttribute("user") @Valid final UserRegistrationDto userRegistrationDto,
            final BindingResult result)
    {
        if (result.hasErrors()){
            System.out.println("Failure");
        }else {
            System.out.println("successfully");
        }
        return "web/emailError";
    }

    private String getAppUrl(HttpServletRequest request){
        return "http://" + request.getServerName() +
                ":" + request.getServerPort() + request.getContextPath();
    }


}
