package com.website.movie.web.controller.web;

import com.website.movie.events.OnVerificationTokenCompleteEvent;
import com.website.movie.helper.error.InvalidDataException;
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
import com.website.movie.web.dto.MailDto;
import com.website.movie.web.dto.UserDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
    public ModelAndView registrationUserAccount(
            @ModelAttribute("user") @Valid final UserDto userDto,
            final BindingResult result,
            final HttpServletRequest request)
    {
        LOGGER.debug("Registering user account with information: {}", userDto);

        // check error valid
        if(result.hasErrors()){
            throw new InvalidDataException(result);
//            throw new MethodArgumentNotValidException(new MethodParameter(
//                    this.getClass().getDeclaredMethod("registrationUserAccount", UserDto.class), 0), result);
        }

        try {
            UserEntity registered = userService.registerNewUserAccount(userDto);
//            final String appUrl = getAppUrl(request);
//            final Locale locale = request.getLocale();
//            final MailDto mailDto = new MailDto("registrationConfirm?", locale);
//            mailDto.constructRegistrationMail();
//            eventPublisher.publishEvent(new OnVerificationTokenCompleteEvent(registered, appUrl, mailDto));
        }catch (final UserAlreadyExistException uaeEx){
            ModelAndView mav = new ModelAndView("web/login", "user", userDto);
            String message = messages.getMessage("message.regError", null, request.getLocale());
            mav.addObject("errorMsg",message);
            return mav;
        }catch (final Exception ex){
          //  LOGGER.warn("Unable to register user", ex);
            ex.printStackTrace();
            userService.deleteUserAccount(userDto.getEmail());
            return new ModelAndView("web/emailError", "user", userDto);
        }
        return new ModelAndView("web/successRegister", "user", userDto);
    }

    @RequestMapping(value = "/registrationConfirm", method = RequestMethod.GET)
    public String ConfirmRegistration(
            final HttpServletRequest request,
            final UserDto userDto,
            final Model model,
            @RequestParam("token") final String token)
    {
        final Locale locale = request.getLocale();

        final VerificationTokenEntity verificationToken = verificationTokenService.getVerificationToken(token);
        if(verificationToken == null){
            final String message = messages.getMessage("auth.message.invalidToken", null, locale);
            model.addAttribute("errorMsg", message);
            return "redirect:/badUser?lang=" + locale.getLanguage();
        }

        final Calendar cal = Calendar.getInstance();
        if(verificationToken.getExpiryDate().getTime() - cal.getTime().getTime() <= 0){
            String message = messages.getMessage("auth.message.expired", null, locale);
            model.addAttribute("errorMsg", message);
            model.addAttribute("expired", true);
            model.addAttribute("token", token);
            return "redirect:/badUser?lang=" + locale.getLanguage();
        }

        final UserEntity user = verificationToken.getUser();
        user.setEnable(true);
        userService.saveRegisteredUser(user);
        model.addAttribute(
                "message",
                messages.getMessage("message.accountVerified", null, locale)
        );
        return "redirect:/login?lang=" + locale.getLanguage();
    }

    @RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
    public String resetPassword(
            @RequestParam(value = "email")final String userEmail,
            final Model model,
            final HttpServletRequest request
    ){
        UserEntity user = userService.findByEmail(userEmail);
        final Locale locale = request.getLocale();
        if(user == null){
            model.addAttribute(
                    "errorMsg",
                    messages.getMessage("message.userNotFound", null, locale)
            );
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
            model.addAttribute(
                    "errorMsg",
                    messages.getMessage("message.emailError", null, "Can't Send Email", locale)
            );
            return "redirect:/login?lang=" + locale.getLanguage();
        }catch (final Exception ex){
            LOGGER.debug(ex.getLocalizedMessage(), ex);
            model.addAttribute("errorMsg", ex.getLocalizedMessage());
            return "redirect:/login?lang=" + locale.getLanguage();
        }
        model.addAttribute(
                "message",
                messages.getMessage("message.resetPasswordEmail", null, "You should receive an Password Reset Email shortly", locale)
        );
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
            model.addAttribute("errorMsg", message);
            return "redirect:/login?lang=" + request.getLocale().getLanguage();
        }
        UserEntity user = vTokenEntity.getUser();
        userService.changeUserPassword(user, newPassword);
        model.addAttribute(
                "message",
                messages.getMessage("message.resetPasswordSuc", null, request.getLocale())
        );
        return "redirect:/login?lang=" + request.getLocale().getLanguage();
    }


    /**
     * valid password check in client-side
     * @param passRaw
     * @param passNew
     * @return
     */
    @RequestMapping(value="/changePassword", method = RequestMethod.POST)
    public ModelAndView changePassword(
            @RequestParam("passRaw") final String passRaw,
            @RequestParam("passNew") final String passNew,
            HttpServletRequest request
    ){
        LOGGER.info("Change Password");
        MyUserPrincipal myUser = (MyUserPrincipal)SessionUtil.getInstance().getValue(request, "USERMODEL");
        ModelAndView mav = new ModelAndView("redirect:/userprofile");
        if (!userService.validChangePassword(passRaw, myUser.getPassword())){
            mav.addObject("message",MessageUtil.getMessage("message.changePassword.invalidRaw"));
            return mav;
        }
        try {
            myUser.setUser(userService.changeUserPassword(myUser.getUser(), passNew));
            SessionUtil.getInstance().putValue(request, "USERMODEL", myUser);
        }catch (Exception ex){
            mav.addObject("message",MessageUtil.getMessage("message.changePassword.Failure"));
            return mav;
        }
        mav.addObject("message",MessageUtil.getMessage("message.changePassword.Suc"));
        return mav;
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
            model.addAttribute(
                    "errorMsg",
                    messages.getMessage("message.emailError", null, "Can't Send Email", locale)
            );
            return "redirect:/login?lang=" + locale.getLanguage();
        }catch (final Exception ex){
            LOGGER.debug(ex.getLocalizedMessage(), ex);
            model.addAttribute("errorMsg", ex.getLocalizedMessage());
            return "redirect:/login?lang=" + locale.getLanguage();
        }
        model.addAttribute(
                "message",
                messages.getMessage("message.resendToken", null, "We will send an email with a new registration token to your email account", locale)
        );
        return "redirect:/login?lang=" + locale.getLanguage();
    }


    @RequestMapping(value = "/test", method = RequestMethod.POST)
    public String checkTest(
            @ModelAttribute("user") @Valid final UserDto userDto,
            final BindingResult result)
    {
        if (result.hasErrors()){
            System.out.println("Failure");
        }else {
            System.out.println("successfully");
        }
        return "web/emailError";

    }

    // =========  NON-API   ==========


    private String getAppUrl(HttpServletRequest request){
        return "http://" + request.getServerName() +
                ":" + request.getServerPort() + request.getContextPath();
    }


}
