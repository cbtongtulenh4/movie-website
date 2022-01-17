package com.website.movie.web.controller.web;

import com.website.movie.persistence.entity.UserEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller(value = "HomeControllerOfWeb")
public class HomeController {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @RequestMapping(value = "/home")
    public String getHome(){
        UserEntity user = new UserEntity();
        return "web/home";
    }

}
