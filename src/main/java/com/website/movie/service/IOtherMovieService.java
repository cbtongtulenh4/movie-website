package com.website.movie.service;

import com.website.movie.persistence.entity.MovieGenresEntity;

import java.util.*;

public interface IOtherMovieService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 09/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    MovieGenresEntity saveGenreMovie(MovieGenresEntity genre);

    void deleteGenresMovie(long[] ids);

    MovieGenresEntity findOneGenreMovieById(long id);

    List<MovieGenresEntity> findAllGenreMovie();
}
