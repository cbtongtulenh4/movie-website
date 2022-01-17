package com.website.movie.web.controller.web;

import com.website.movie.events.OnRegistrationCompleteEvent;
import com.website.movie.helper.error.UserAlreadyExistException;
import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.persistence.entity.VerificationTokenEntity;
import com.website.movie.service.IUserService;
import com.website.movie.service.IVerificationTokenService;
import com.website.movie.web.dto.UserDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ConcurrentModel;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
    private MessageSource message;

    @Autowired
    private IUserService userService;

    @Autowired
    private IVerificationTokenService verificationTokenService;

    @Autowired
    private ApplicationEventPublisher eventPublisher;

    @Autowired
    private MessageSource messages;



    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public ModelAndView registrationUserAccount(
            @ModelAttribute("user") final UserDto userDto,
            final HttpServletRequest request)
    {
        LOGGER.debug("Registering user account with information: {}", userDto);

        try {
            UserEntity registered = userService.registerNewUserAccount(userDto);
            final String appUrl = "http://" + request.getServerName() +
                    ":" + request.getServerPort() + request.getContextPath();
            final Locale locale = request.getLocale();

            eventPublisher.publishEvent(new OnRegistrationCompleteEvent(registered, locale, appUrl));
        }catch (final UserAlreadyExistException uaeEx){
            ModelAndView mav = new ModelAndView("web/login", "user", userDto);
            String message = messages.getMessage("message.regError", null, request.getLocale());
            mav.addObject("message",message);
        }catch (final Exception ex){
            LOGGER.warn("Unable to register user", ex);
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
            model.addAttribute("message", message);
            return "redirect:/badUser?lang=" + locale.getLanguage();
        }

        final Calendar cal = Calendar.getInstance();
        if(verificationToken.getExpiryDate().getTime() - cal.getTime().getTime() <= 0){
            String message = messages.getMessage("auth.message.expired", null, locale);
            model.addAttribute("message", message);
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

    @RequestMapping("/test")
    public ModelAndView checkTest(final HttpServletRequest request){
        Model model = new ConcurrentModel();
        model.addAttribute(
                "message",
                messages.getMessage("message.accountVerified", null, request.getLocale())
        );
        return new ModelAndView("redirect:/login", "model", model);
    }

}
