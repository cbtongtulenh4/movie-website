package com.website.movie.service;

import com.website.movie.persistence.entity.TVEpisodeEntity;
import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.web.dto.MovieFilterDto;
import com.website.movie.web.dto.TVSeasonUiDto;
import com.website.movie.web.dto.WatchTvSeasonDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.*;

public interface ITvSeasonService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 03/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
      */

    TVSeasonEntity createSeasonMovie(TVSeasonUiDto tvSeasonDto);

    TVSeasonEntity getSeasonMovieById(Long id);

    List<TVSeasonEntity> getAllSeasonMovie();

    long countSeasonMovie();

    List<TVSeasonEntity> getSeasonMoviesByFilter(MovieFilterDto movieFilter);

    WatchTvSeasonDto getWatchTvSeasonUiByCode(String code);

    TVSeasonEntity getSeasonMovieEntityByCode(String code);

    Page<TVSeasonEntity> findAll(Pageable paging);

    TVSeasonUiDto getSeasonMovieByCode(String code, final Long user_id);

    //List<TVSeasonEntity> findAll(Pageable paging);

}
