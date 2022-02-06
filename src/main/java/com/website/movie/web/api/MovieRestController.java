package com.website.movie.web.api;

import com.website.movie.helper.converter.MovieConvert;
import com.website.movie.helper.error.InvalidDataException;
import com.website.movie.persistence.entity.MovieEntity;
import com.website.movie.service.IMovieService;
import com.website.movie.web.dto.MovieDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.*;

@RestController(value = "MovieRestAPI")
public class MovieRestController {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 31/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private IMovieService movieService;

    private static final Logger LOGGER = LoggerFactory.getLogger(MovieRestController.class);

    @GetMapping(value = "/api/movie")
    public List<MovieDto> getMovies(){
        return movieService.getMovies();
    }

    @PostMapping(value = "/api/movie")
    public MovieDto createMovie(
            @RequestBody @Valid final MovieDto movie,
            final BindingResult result)
    {
        LOGGER.info("Create a movie with information: {}", movie);
        if (result.hasErrors()){
            throw new InvalidDataException(result);
        }
        MovieEntity movieEntity = MovieConvert.toEntity(movie);
        return MovieConvert.toDto(movieService.createMovie(movieEntity));
    }


}
