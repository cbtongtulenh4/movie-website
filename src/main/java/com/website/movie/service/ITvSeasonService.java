package com.website.movie.service;

import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.web.dto.MovieFilterDto;
import com.website.movie.web.dto.TVSeasonUiDto;
import com.website.movie.web.dto.WatchTvSeasonDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;

public interface ITvSeasonService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 03/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
      */

    TVSeasonEntity createSeasonMovie(TVSeasonUiDto tvSeasonDto);
    TVSeasonEntity createSeasonMovie(TVSeasonEntity tvSeasonEntity);

    TVSeasonEntity getSeasonMovieById(Long id);

    List<TVSeasonEntity> getAllSeasonMovie();

    long countSeasonMovie();

    List<TVSeasonEntity> getSeasonMoviesByFilter(MovieFilterDto movieFilter, Sort sort);

    WatchTvSeasonDto getWatchTvSeasonUiByCode(String code);

    TVSeasonEntity getSeasonMovieEntityByCode(String code);

    Page<TVSeasonEntity> findAll(Pageable paging);

    TVSeasonUiDto getSeasonMovieByCode(String code, final Long user_id);

    List<TVSeasonUiDto> findLimitPopularByViews(String field, String sort, int limit);

    //List<TVSeasonEntity> findAll(Pageable paging);

}
