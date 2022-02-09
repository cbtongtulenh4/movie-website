package com.website.movie.service;

import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.web.dto.MovieFilterDto;

import java.util.*;

public interface ITvSeasonService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 03/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
      */

    TVSeasonEntity createSeasonMovie(TVSeasonEntity tvSeason);

    TVSeasonEntity getSeasonMovieById(Long id);

    List<TVSeasonEntity> getAllSeasonMovie();

    long countSeasonMovie();

    List<TVSeasonEntity> getSeasonMoviesByFilter(MovieFilterDto movieFilter);

}
