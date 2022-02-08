package com.website.movie.web.controller.web;

import com.website.movie.helper.converter.Convert;
import com.website.movie.helper.converter.MovieConvert;
import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.service.IMovieService;
import com.website.movie.service.ITvSeasonService;
import com.website.movie.web.dto.TVSeasonDto;
import com.website.movie.web.dto.TVSeasonUiDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "HomeControllerOfWeb")
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

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String getHome(){
        return "web/home";
    }

    @RequestMapping(value = "/movieSingle", method = RequestMethod.GET)
    public ModelAndView getMovieSingle(
            @RequestParam(value = "id") final Long id
    )
    {
        ModelAndView mav = new ModelAndView("web/movieSingle");
        TVSeasonEntity tvSeasonEntity =  seasonService.getSeasonMovieById(id);
        mav.addObject("SEASON", MovieConvert.toDto(tvSeasonEntity));
        return mav;
    }
    @RequestMapping(value = "/movielist")
    public ModelAndView getMovies(){
        ModelAndView mav = new ModelAndView("web/movielist");
        return mav;
    }

}
