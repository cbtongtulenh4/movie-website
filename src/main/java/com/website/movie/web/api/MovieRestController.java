package com.website.movie.web.api;

import com.website.movie.helper.converter.MovieConvert;
import com.website.movie.persistence.entity.MovieEntity;
import com.website.movie.service.IMovieService;
import com.website.movie.web.dto.MovieDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

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

//    @GetMapping
//    public MovieDto getMovies(){
//        return movieService.getMovies();
//    }

    @PostMapping(value = "/api/movie")
    public MovieDto createMovie(MovieDto movie){
        MovieEntity movieEntity = MovieConvert.toEntity(movie);
        return MovieConvert.toDto(movieService.createMovie(movieEntity));
    }


}
