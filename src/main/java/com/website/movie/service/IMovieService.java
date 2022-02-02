package com.website.movie.service;

import com.website.movie.persistence.entity.MovieEntity;

import java.util.*;

public interface IMovieService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 01/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    MovieEntity getMovieById(Long id);
    List<MovieEntity> getMovies();
    MovieEntity updateMovie(MovieEntity movieEntity);
    MovieEntity createMovie(MovieEntity movieEntity);
    void deleteMovies(Long[] ids);


}
