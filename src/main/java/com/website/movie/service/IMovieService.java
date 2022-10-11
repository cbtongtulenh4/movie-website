package com.website.movie.service;

import com.website.movie.persistence.entity.MovieEntity;
import com.website.movie.web.dto.MovieDto;
import com.website.movie.web.dto.MovieListPageDto;
import com.website.movie.web.dto.SimpleTvSeasonDto;

import java.util.List;

public interface IMovieService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 01/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     * @return
     */

    MovieEntity getMovieById(Long id);
    MovieEntity createMovie(MovieEntity movieEntity);

    List<MovieEntity> saveAllMovies(List<MovieEntity> movies);

    List<MovieDto> getMovies();
    void deleteMovies(Long[] ids);
    void deleteAllMovies();
    List<MovieEntity> insertListMovieEntity(List<MovieEntity> movieEntities);

    List<MovieEntity> scrapingMovieData(final String URL, final String container);

    List<SimpleTvSeasonDto> findAllTvSeasonById(long movieId);

    MovieListPageDto<SimpleTvSeasonDto> findAllRelateTvSeasonById(long movieId, long tvSeasonId, int pageNo, int pageSize);
}
