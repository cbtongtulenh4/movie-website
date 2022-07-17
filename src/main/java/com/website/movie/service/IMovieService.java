package com.website.movie.service;

import com.website.movie.persistence.entity.MovieEntity;
import com.website.movie.web.dto.MovieDto;

import java.util.*;

public interface IMovieService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 01/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     * @return
     */

    MovieEntity getMovieById(Long id);
    List<MovieDto> getMovies();
    MovieEntity updateMovie(MovieEntity movieEntity);
    MovieEntity createMovie(MovieEntity movieEntity);
    void deleteMovies(Long[] ids);
    void deleteAllMovies();

    List<MovieEntity> scrapingMovieData(final String URL, final String container);


}
