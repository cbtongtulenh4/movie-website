package com.website.movie.web.controller.web;

import com.website.movie.helper.converter.Convert;
import com.website.movie.helper.converter.MovieConvert;
import com.website.movie.persistence.entity.MovieGenresEntity;
import com.website.movie.persistence.entity.TVEpisodeEntity;
import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.security.MyUserPrincipal;
import com.website.movie.service.IMovieService;
import com.website.movie.service.IOtherMovieService;
import com.website.movie.service.ITvSeasonService;
import com.website.movie.utils.PageableUtil;
import com.website.movie.web.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

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

    @Autowired
    private IOtherMovieService otherMovieService;

    @RequestMapping(value = {"/home", "", "/"}, method = RequestMethod.GET)
    public String getHome(){
        return "web/home";
    }

//    @RequestMapping(value = "/movie-single", method = RequestMethod.GET)
//    public ModelAndView getMovieSingle(
//            @RequestParam(value = "id") final Long id
//    )
//    {
//        ModelAndView mav = new ModelAndView("web/movie-single");
//        TVSeasonEntity tvSeasonEntity =  seasonService.getSeasonMovieById(id);
//        mav.addObject("SEASON", MovieConvert.toDto(tvSeasonEntity));
//        return mav;
//    }

    @RequestMapping(value = "/movie-list")
    public ModelAndView getMovies(
            @RequestParam(value = "sort", defaultValue = "title-1") final String sortParam,
            @RequestParam(value = "nextPage", defaultValue = "1") final int pageNo,
            @RequestParam(value = "maxPageItem", defaultValue = "2") final int limitMovie
    ){
        ModelAndView mav = new ModelAndView("web/movielist");
//        List<TVSeasonEntity> tvSeasons =  seasonService.getAllSeasonMovie();
        Page<TVSeasonEntity> pagination = seasonService.findAll(
                PageableUtil.paging(pageNo - 1, limitMovie, sortParam)
        );
        List<SimpleTvSeasonDto> seasons = new ArrayList<>();
        pagination.getContent().forEach(e -> {
            seasons.add(MovieConvert.toSimpleTvSeasonDto(e));
        });
        List<MovieGenresEntity> genres = otherMovieService.findAllGenreMovie();


        mav.addObject("SEASONS", seasons);
        mav.addObject("GENRES", genres);
        mav.addObject(
                "PAGINATION",
                new PaginationDto(limitMovie, pageNo, pagination.getTotalPages(), pagination.getTotalElements())
        );

        return mav;
    }

    /**
     * get Single Movie by code of Season Movie
     * @param code is attribute of season entity
     * @return
     */
    @RequestMapping(value = "/{code}")
    public ModelAndView getSingleMovie(
        @PathVariable final String code
    ){
        ModelAndView mav = new ModelAndView("web/movieSingle");
        TVSeasonUiDto tvSeason =  seasonService.getSeasonMovieByCode(code, 1L);
        mav.addObject("SEASON_MOVIE", tvSeason);
        return mav;
    }

    @RequestMapping(value = "/{code}/watch/ep-{id}")
    public ModelAndView getEpisodeWatch(
            @PathVariable final int id,
            @PathVariable final String code
    ){
        ModelAndView mav = new ModelAndView("web/watch");
        WatchTvSeasonDto watchTvSeasonDto = seasonService.getWatchTvSeasonUiByCode(code);
        TVEpisodeEntity episode = null;
        for (TVEpisodeEntity ep : watchTvSeasonDto.getEpisodes()){
            if (ep.getNumEp() == id){
                episode = ep;
                break;
            }
        }
        List<CommentDto> commentDtos = otherMovieService.getCommentByParentIdAndTvSeasonId(0L, watchTvSeasonDto.getId());
        mav.addObject("COMMENTS", commentDtos);
        mav.addObject("WATCH_MODEL", watchTvSeasonDto);
        mav.addObject("EPISODE", episode);
        return mav;
    }

    @RequestMapping(value = "/blog-list")
    public String getBlogList(){
        return "web/blogList";
    }


    @RequestMapping(value = "/userprofile")
    public ModelAndView getUserProfile(
            HttpServletRequest request
    ){
        ModelAndView mav = new ModelAndView("web/userprofile");
//        MyUserPrincipal myUser = (MyUserPrincipal) request.getAttribute("USER_MODEL");
//        UserProfileDto userProfileDto = Convert.convertModel(
//                myUser.getUser().getProfile(),
//                UserProfileDto.class
//        );
//        userProfileDto.setName(myUser.getUser().getName());
//        userProfileDto.setEmail(myUser.getEmail());
        UserProfileDto userProfileDto = new UserProfileDto();
        userProfileDto.setId(1L);
        userProfileDto.setEmail("cbtongtulenh4@gmail.com");
        userProfileDto.setAvatar("1AgSl-hwXANHMURIA0niPyD5hhZ7jqYvD");
        userProfileDto.setAge(18);
        userProfileDto.setCountry("New York");
        userProfileDto.setFirstName("Jonh");
        userProfileDto.setLastName("Max");
        userProfileDto.setGender("Boy");
        userProfileDto.setName("Fu");
        userProfileDto.setState("Free");
        mav.addObject("USER_PROFILE", userProfileDto);
        return mav;
    }

    @RequestMapping(value = "/user-favorite")
    public String getUserFavoriteMovies(){
        return "web/userfavoritelist";
    }

    @RequestMapping(value = "/movie-grid")
    public String getMovieGrid(){
        return "web/movieGrid";
    }

    @RequestMapping(value = "/test")
    public String getTest(){
        return "web/test";
    }


}