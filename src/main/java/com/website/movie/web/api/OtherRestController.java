package com.website.movie.web.api;

import com.website.movie.helper.converter.Convert;
import com.website.movie.helper.error.InvalidDataException;
import com.website.movie.persistence.dao.ICommentDAO;
import com.website.movie.persistence.dao.impl.CommentImpl;
import com.website.movie.persistence.entity.*;
import com.website.movie.security.MyUserPrincipal;
import com.website.movie.service.*;
import com.website.movie.utils.SessionUtil;
import com.website.movie.web.dto.CommentDto;
import com.website.movie.web.dto.MovieCategoryDto;
import com.website.movie.web.dto.RateDto;
import com.website.movie.web.dto.ScrapingDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@RestController(value = "OtherRestAPI")
public class OtherRestController {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 02/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private IMovieCategoryService movieCategoryService;
    @Autowired
    private IMovieService movieService;
    @Autowired
    private IOtherMovieService otherMovieService;
    @Autowired
    private IUserService userService;
    @Autowired
    private ITvSeasonService tvSeasonService;
    @Autowired
    private IScrapingService scrapingService;

    private ICommentDAO commentDAO = new CommentImpl();

    private static final Logger LOGGER = LoggerFactory.getLogger(OtherRestController.class);

    @PostMapping(value = "/api/movie/category")
    public MovieCategoryDto createMovieCategory(
            @RequestBody @Valid final MovieCategoryDto movieCategoryDto,
            final BindingResult result)
    {
        LOGGER.info("Create a movie category with information: {}", movieCategoryDto);
        if (result.hasErrors()){
            throw new InvalidDataException(result);
        }
        MovieCategoryEntity movieCategoryEntity = Convert.convertModel(movieCategoryDto, MovieCategoryEntity.class);
        movieCategoryEntity = movieCategoryService.createMovieCategory(movieCategoryEntity);
        return Convert.convertModel(movieCategoryEntity, MovieCategoryDto.class);
    }

    @PostMapping(value = "/api/movie/season/genre")
    public MovieGenresEntity createGenreMovie(
            @RequestBody @Valid final MovieGenresEntity genreEntity,
            final BindingResult result )
    {
        LOGGER.info("Create a genre movie with information: {}", genreEntity);
        if (result.hasErrors()) {
            throw new InvalidDataException(result);
        }
        return otherMovieService.saveGenreMovie(genreEntity);
    }

    @PostMapping(value = "/api/movie/season/studio")
    public StudioEntity createStudio(@RequestBody final StudioEntity studioEntity){
        return otherMovieService.saveStudio(studioEntity);
    }

    @PostMapping(value = "/api/movie/season/list-genre")
    public List<MovieGenresEntity> createGenreMovie(
            @RequestBody List<MovieGenresEntity> genres
    )
    {
//        LOGGER.info("Create a genre movie with information: {}", genres);
//        if (result.hasErrors()) {
//            throw new InvalidDataException(genres);
//        }
        return otherMovieService.saveListGenreMovie(genres);
    }


    @PutMapping(value = "/api/movie/season/rate")
    public RateDto updateRate(
            @RequestParam(value = "rateVal") final Integer rateVal,
            @RequestParam(value = "tvSeasonId") final Long tvSeasonId,
            HttpServletRequest request
    ){
        MyUserPrincipal myUser = (MyUserPrincipal) SessionUtil.getInstance().getValue(request, "USER_MODEL");
        UserEntity user = userService.findByUsername(myUser.getUsername());
        TVSeasonEntity tvSeason = tvSeasonService.getSeasonMovieById(tvSeasonId);
        otherMovieService.save(new RateEntity(rateVal, user, tvSeason));
        return otherMovieService.getRateMovieSeason(tvSeasonId);
    }

    @GetMapping(value = "/api/movie/season/rate")
    public RateDto getRateById(
            @RequestParam(value = "seasonId") final Long seasonId
    ){
        return otherMovieService.getRateMovieSeason(seasonId);
    }

    @PostMapping(value = "/api/movie/season/comment")
    public CommentDto createComment(
            @RequestBody CommentEntity commentEntity,
            @RequestParam(value = "tvSeasonId") final Long tvSeasonId,
            @RequestParam(value = "parentId") final Long cmParentId
    ){
        CommentEntity comment = otherMovieService.save(commentEntity);
        commentDAO.saveCommentEntity(comment.getId(), cmParentId, tvSeasonId);
        return Convert.toCommentDto(commentEntity, cmParentId);
    }

    @GetMapping(value = "/api/movie/season/comment")
    public List<CommentDto> getAllComment(){
        return otherMovieService.getCommentByParentIdAndTvSeasonId(0L, 1L);
    }

    @PutMapping(value = "/api/movie/season/comment/num-like")
    public int updateNumLike(
            @RequestParam(value = "isLike") final boolean isLike,
            @RequestParam(value = "commentId") final long commentId
    ){
        return otherMovieService.updateLikeCommentById(isLike, commentId);
    }

    @PutMapping(value = "/api/movie/season/comment/spam")
    public void updateSpamComment(
            @RequestParam(value = "isSpam") final boolean isSpam,
            @RequestParam(value = "commentId") final long commentId
    ){
        
        otherMovieService.updateSpamCommentById(isSpam, commentId);
    }


    @PostMapping(value = "/api/scraping/movie")
    public List<MovieEntity> scrapingAllMovie(
            @RequestBody ScrapingDto scrapingDto
    ){
        return movieService.saveAllMovies(scrapingService.getJsoupAllMovie(
                scrapingDto.getUrl(),
                scrapingDto.getContainer()
        ));
    }


    @PostMapping(value = "/api/scraping/genres")
    public List<String> scrapingGenres(
            @RequestBody ScrapingDto scrapingDto
    ){
        movieService.saveAllMovies(scrapingService.getJsoupAllMovie(
                scrapingDto.getUrl(),
                scrapingDto.getContainer()
        ));
        return scrapingService.getJsoupGenres(
                scrapingDto.getUrl(),
                scrapingDto.getContainer()
        );
    }


}