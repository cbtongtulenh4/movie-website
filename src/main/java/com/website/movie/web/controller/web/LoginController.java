package com.website.movie.web.controller.web;

import com.website.movie.constant.SystemConstants;
import com.website.movie.helper.error.InvalidDataException;
import com.website.movie.security.MyUserPrincipal;
import com.website.movie.security.custom.GrantedAuthority;
import com.website.movie.service.IUserService;
import com.website.movie.web.dto.UserLoginDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Collection;

@Controller(value = "LoginControllerOfWeb")
public class LoginController {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private IUserService userService;

    @Autowired
    private MessageSource messages;

    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView getLogin(
//            @RequestParam("errorMsg", required = false) final String errorMsg,
//            @RequestParam("message", required = false) final String message)
            final Model model)
    {
        final ModelAndView mav = new ModelAndView("web/login");
        mav.addObject("errorMsg", model.asMap().get("errorMsg"));
        mav.addObject("message", model.asMap().get("message"));
        return mav;
    }

    @PostMapping(value = "/handleLogin")
    public String handleLogin(
            @ModelAttribute("userLogin") @Valid final UserLoginDto userLogin,
            final BindingResult result,
            final RedirectAttributes redirectAttributes,
            final HttpServletRequest request)
    {
        LOGGER.debug("Login account with information: {}", userLogin);
        if (result.hasErrors()){
            throw new InvalidDataException(result);
        }
        MyUserPrincipal myUser = null;
        try {
            myUser = userService.loadUserByEmail(userLogin);
        }catch (Exception ex){
            LOGGER.warn(ex.getLocalizedMessage(), ex);
            final String message = messages.getMessage("message.user.loginError", null, request.getLocale());
            redirectAttributes.addFlashAttribute("errorMsg", message);
            return "redirect:/login?lang=" + request.getLocale().getLanguage();
        }
        final String loginStatus = userService.checkLoadUser(myUser);
        if (loginStatus != SystemConstants.SUCCESS){
            LOGGER.warn("Account Not Enable");
            final String message = messages.getMessage("message.user." + loginStatus, null, request.getLocale());
            redirectAttributes.addFlashAttribute("errorMsg", message);
            return "redirect:/login?lang=" + request.getLocale().getLanguage();
        }
        final String message = messages.getMessage("message.user.loginSuccessful", null, request.getLocale());
        redirectAttributes.addFlashAttribute("message", message);
        request.getSession().setAttribute("USERMODEL", myUser);
        return AuthorizationUserLogin(myUser.getAuthority(), request);
    }

    private String AuthorizationUserLogin(final Collection<? extends GrantedAuthority> authorities, final HttpServletRequest request){
        for (GrantedAuthority authority : authorities){
            if (authority.getAuthority().equals(SystemConstants.USER)){
                return "redirect:/home?lang=" + request.getLocale().getLanguage();
            }
        }
        return "redirect:/admin?lang=" + request.getLocale().getLanguage();
    }

}
