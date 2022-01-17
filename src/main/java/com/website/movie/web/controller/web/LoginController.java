package com.website.movie.web.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller(value = "LoginControllerOfWeb")
public class LoginController {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @RequestMapping(value = "/login")
    public String getLogin(){
        return "web/login";
    }

}
