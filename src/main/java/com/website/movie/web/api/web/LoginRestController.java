package com.website.movie.web.api.web;

import com.website.movie.constant.MessageConstants;
import com.website.movie.constant.SystemConstants;
import com.website.movie.security.MyUserPrincipal;
import com.website.movie.security.custom.GrantedAuthority;
import com.website.movie.service.IUserService;
import com.website.movie.utils.SessionUtil;
import com.website.movie.web.dto.MessageDto;
import com.website.movie.web.dto.UserLoginDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Collection;

@RestController
public class LoginRestController {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private IUserService userService;

    @Autowired
    private MessageSource messages;

    @PostMapping(value = "/api/handleLogin")
    public String handleLogin(
            @RequestBody final UserLoginDto userLogin,
            final BindingResult result,
            final HttpServletRequest request) throws IOException {
//        LOGGER.debug("Login account with information: {}", userLogin);
        if (result.hasErrors()){
//            throw new InvalidDataException(result);
            System.out.println("error");
        }
        MyUserPrincipal myUser = null;
        try {
            myUser = userService.loadUserByUsername(userLogin);
        }catch (Exception ex){
//            LOGGER.warn(ex.getLocalizedMessage(), ex);
            final String message = messages.getMessage("message.user.loginError", null, request.getLocale());
            return (new MessageDto(MessageConstants.DANGER, message)).toStringJson();
        }
        final String loginStatus = userService.checkLoadUser(myUser);
        if (!loginStatus.equals(SystemConstants.SUCCESS)){
//            LOGGER.warn("Account Not Enable");
            final String message = messages.getMessage("message.user." + loginStatus, null, request.getLocale());
            return (new MessageDto(MessageConstants.DANGER, message)).toStringJson();

        }
        SessionUtil.getInstance().putValue(request,"USER_MODEL", myUser);// save info user for session
//        SessionUtil.getInstance().savePreviousPageByRequest(request);
        return AuthorizationUserLogin(myUser.getAuthority(), request);
    }

    private String AuthorizationUserLogin(final Collection<? extends GrantedAuthority> authorities, HttpServletRequest request){
        for (GrantedAuthority authority : authorities){
            if (authority.getAuthority().equals(SystemConstants.USER)){
                return request.getHeader("Referer");
            }
        }
        return request.getContextPath() + "/admin";
    }


}
