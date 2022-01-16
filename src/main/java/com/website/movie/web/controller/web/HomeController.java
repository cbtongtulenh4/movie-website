package com.website.movie.web.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller(value = "HomeControllerOfWeb")
public class HomeController {

    @RequestMapping(value = "/home")
    public String getHome(){
        return "web/home";
    }

}
