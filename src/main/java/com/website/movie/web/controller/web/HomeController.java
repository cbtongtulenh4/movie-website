package com.website.movie.web.controller.web;

import com.website.movie.constant.MessageConstants;
import com.website.movie.helper.converter.MovieConvert;
import com.website.movie.persistence.entity.MovieGenresEntity;
import com.website.movie.persistence.entity.TVEpisodeEntity;
import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.service.IMovieService;
import com.website.movie.service.IOtherMovieService;
import com.website.movie.service.ITvSeasonService;
import com.website.movie.utils.PageableUtil;
import com.website.movie.utils.SessionUtil;
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
import java.util.*;

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
    public ModelAndView getHome(HttpServletRequest request){
        ModelAndView mav = new ModelAndView("web/home");
        String contentMsg = (String) SessionUtil.getInstance().getAndRemoveValue(request, "message");
        if (contentMsg != null && !contentMsg.isEmpty()){
            MessageDto msg = new MessageDto(MessageConstants.DANGER, contentMsg);
            mav.addObject("message", msg);
        }

        mav.addObject("ListTvSeason1", MovieConvert.toSimpleTvSeasonDto(otherMovieService.findLimitTvSeasonByForm("anime-le")));
        mav.addObject("ListTvSeason2", MovieConvert.toSimpleTvSeasonDto(otherMovieService.findLimitTvSeasonByForm("anime-bo")));

        return mav;
    }

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

        MessageDto msg = new MessageDto(MessageConstants.DANGER, "Login Failure", "signup");
        mav.addObject("message", msg);
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

        Page<TVSeasonEntity> pagination = seasonService.findAll(
                PageableUtil.paging(0, 5)
        );
        List<SimpleTvSeasonDto> tvSeasonRelate = new ArrayList<>();
        pagination.getContent().forEach(e -> {
            tvSeasonRelate.add(MovieConvert.toSimpleTvSeasonDto(e));
        });

        mav.addObject("SEASON_MOVIE", tvSeason);
        mav.addObject("TVSEASON_RELATE", tvSeasonRelate);
        return mav;
    }

    @RequestMapping(value = "/{code}/watch/ep-{id}")
    public ModelAndView getEpisodeWatch(
            @PathVariable final int id,
            @PathVariable final String code
    ){
        ModelAndView mav = new ModelAndView("web/watch");
        WatchTvSeasonDto watchTvSeasonDto = seasonService.getWatchTvSeasonUiByCode(code);
        Set<TVEpisodeEntity> episodeEntities = new TreeSet<>(Comparator.comparingInt(TVEpisodeEntity::getNumEp));
        episodeEntities.addAll(watchTvSeasonDto.getEpisodes());
        watchTvSeasonDto.setEpisodes(episodeEntities);
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
        userProfileDto.setAvatar("1krE9UFmEAiVP2oc9jbyf-8oZapHqb1gz");
        userProfileDto.setAge(18);
        userProfileDto.setCountry("New York");
        userProfileDto.setGender("Boy");
        userProfileDto.setUsername("Fu.MinhPhuc");
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