package com.website.movie.web.controller.web;

import com.website.movie.constant.MessageConstants;
import com.website.movie.constant.SystemConstants;
import com.website.movie.security.MyUserPrincipal;
import com.website.movie.security.custom.GrantedAuthority;
import com.website.movie.service.IUserService;
import com.website.movie.utils.SessionUtil;
import com.website.movie.web.dto.MessageDto;
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
import java.util.Collection;
import java.util.Optional;

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
//            @RequestParam(value = "errorMsg", required = false) final String errorMsg,
            @RequestParam(value = "authMsg", required = false) final String message1,
            final Model model,
            HttpServletRequest request)
    {
        final ModelAndView mav = new ModelAndView("web/login");
        mav.addObject("errorMsg", model.asMap().get("errorMsg"));
        mav.addObject("message", model.asMap().get("message"));
        mav.addObject("authMsg", message1);
        return mav;
    }

    @PostMapping(value = "/handleLogin")
    public String handleLogin(
            @ModelAttribute("userLogin") final UserLoginDto userLogin,
            final BindingResult result,
            final RedirectAttributes redirectAttributes,
            final HttpServletRequest request)
    {
        LOGGER.debug("Login account with information: {}", userLogin);
        if (result.hasErrors()){
//            throw new InvalidDataException(result);
            System.out.println("error");
        }
        MyUserPrincipal myUser = null;
        try {
            myUser = userService.loadUserByUsername(userLogin);
        }catch (Exception ex){
            LOGGER.warn(ex.getLocalizedMessage(), ex);
            final String message = messages.getMessage("message.user.loginError", null, request.getLocale());
            MessageDto msg = new MessageDto(MessageConstants.DANGER, message);
            redirectAttributes.addFlashAttribute("message", msg);
//            System.out.println("sfdajsfj: " + request.getContextPath() + request.getServletPath());
            return getPreviousPageByRequest(request).orElse("redirect:/");
        }
        final String loginStatus = userService.checkLoadUser(myUser);
        if (!loginStatus.equals(SystemConstants.SUCCESS)){
            LOGGER.warn("Account Not Enable");
            final String message = messages.getMessage("message.user." + loginStatus, null, request.getLocale());
            MessageDto msg = new MessageDto(MessageConstants.DANGER, message);
            redirectAttributes.addFlashAttribute("message", msg);
            return getPreviousPageByRequest(request).orElse("redirect:/");
        }
//        final String message = messages.getMessage("message.user.loginSuccessful", null, request.getLocale());
//        MessageDto msg = new MessageDto(MessageConstants.DANGER, message);
//        redirectAttributes.addFlashAttribute("message", msg);
        SessionUtil.getInstance().putValue(request,"USER_MODEL", myUser);// save info user for session
//        redirectAttributes.addAttribute("USER_MODEL", myUser);
        return AuthorizationUserLogin(myUser.getAuthority(), request);
    }

    @RequestMapping(value = "/logout")
    public String getLogout( HttpServletRequest request){
        SessionUtil.getInstance().removeValue(request, "USER_MODEL");
        return SessionUtil.getInstance().getPreviousPageByRequest(request).orElse("redirect:/home");
    }

    private String AuthorizationUserLogin(final Collection<? extends GrantedAuthority> authorities, final HttpServletRequest request){
        for (GrantedAuthority authority : authorities){
            if (authority.getAuthority().equals(SystemConstants.USER)){
                return "redirect:/home?lang=" + request.getLocale().getLanguage();
            }
        }
        return "redirect:/admin?lang=" + request.getLocale().getLanguage();
    }

    /*
        Returns the viewName to return for coming back to the sender url
     */
    private Optional<String> getPreviousPageByRequest(HttpServletRequest request){
        return Optional.ofNullable(request.getHeader("Referer")).map(requestURL -> "redirect:" + requestURL);
    }


}
