package com.website.movie.service;

import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.web.dto.MovieFilterDto;
import com.website.movie.web.dto.SimpleTvSeasonDto;
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

    TVSeasonUiDto getTvSeasonUiDtoByCode(String code, final long user_id);
    TVSeasonUiDto getTvSeasonUiDtoByCode(String code);
    TVSeasonUiDto getTvSeasonUiDtoById(long id);

    List<TVSeasonUiDto> findLimitPopularByViews(String field, String sort, int limit);
    List<SimpleTvSeasonDto> findLimitPopularByRate(String sort);

    List<TVSeasonEntity> findTVSeasonByForm(String formCode, String nameTv);

    String getTitleById(long id);

    //List<TVSeasonEntity> findAll(Pageable paging);


    void savePathEpisode(final String tvSeasonCode, final int numEp, final String path);

    Page<TVSeasonEntity> findAllRelateTvSeasonByMovieId(long movieId, Pageable paging);

}
