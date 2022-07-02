package com.website.movie.web.controller.admin;

import com.website.movie.service.IMovieService;
import com.website.movie.service.ITvEpisodeService;
import com.website.movie.service.ITvSeasonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "HomeControllerOfAdmin")
public class HomeController {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private IMovieService movieService;

    @Autowired
    private ITvSeasonService seasonService;

    @Autowired
    private ITvEpisodeService episodeService;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String getAdminHome(){
        return "admin/home";
    }


    @RequestMapping(value = "/admin/movie-list", method = RequestMethod.GET)
    public ModelAndView getMovieList(){
        ModelAndView mav = new ModelAndView("admin/movielist");

        mav.addObject("MOVIES", movieService.getMovies());
        return mav;
    }

    @RequestMapping(value = "/admin/list-data")
    public String getAllData(){
        return "admin/listData";
    }

}
