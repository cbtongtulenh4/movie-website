package com.website.movie.service;

import com.website.movie.persistence.entity.TVSeasonEntity;

public interface ITvSeasonService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 03/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
      */

    TVSeasonEntity createSeasonMovie(TVSeasonEntity tvSeason);

    TVSeasonEntity getSeasonMovieById(Long id);

    long countSeasonMovie();

}
