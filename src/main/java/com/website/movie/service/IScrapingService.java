package com.website.movie.service;

import com.website.movie.persistence.entity.MovieEntity;

import java.util.List;

public interface IScrapingService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 05/03/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    List<MovieEntity> getJsoupAllMovie(final String URL, final String container);

    List<String> getJsoupGenres(final String URL, final String container);

}
