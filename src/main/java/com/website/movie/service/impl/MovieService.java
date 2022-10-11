package com.website.movie.service.impl;

import com.website.movie.helper.converter.MovieConvert;
import com.website.movie.persistence.entity.MovieEntity;
import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.persistence.repository.MovieRepository;
import com.website.movie.service.IMovieService;
import com.website.movie.web.dto.MovieDto;
import com.website.movie.web.dto.SimpleTvSeasonDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class MovieService implements IMovieService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 01/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private MovieRepository movieRepository;

    private static final Logger LOGGER = LoggerFactory.getLogger(MovieService.class);

    @Override
    public MovieEntity getMovieById(Long id) {
        return movieRepository.findById(id).orElse(null);
    }

    @Override
    public List<MovieDto> getMovies() {
        List<MovieEntity> movieEntities = movieRepository.findAll();
        List<MovieDto> movieDtos = new ArrayList<>();
        movieEntities.forEach(e -> {
            LOGGER.info("Get genres season movie with information: {}", e.getCategories());
            for (TVSeasonEntity seasonEntity: e.getTvSeasons()) {
                seasonEntity.getRates().size();
            }
            movieDtos.add(MovieConvert.toDto(e));
        });
        return movieDtos;
    }

    @Override
    public MovieEntity createMovie(MovieEntity movieEntity) {
        return movieRepository.save(movieEntity);
    }

    @Override
    public List<MovieEntity> saveAllMovies(List<MovieEntity> movies) {
        return movieRepository.saveAll(movies);
    }

    @Override
    public void deleteMovies(Long[] ids) {
        for (Long id : ids){
            movieRepository.deleteById(id);
        }
    }

    @Override
    public void deleteAllMovies(){
        movieRepository.deleteAll();
    }

    @Override
    public List<MovieEntity> insertListMovieEntity(List<MovieEntity> movieEntities) {
        return movieRepository.saveAll(movieEntities);
    }

    @Override
    public List<MovieEntity> scrapingMovieData(String URL, String container) {

        return null;
    }

    @Override
    public List<SimpleTvSeasonDto> findAllTvSeasonById(long movieId) {
        MovieEntity movie = movieRepository.findById(movieId).orElse(null);
        if (movie == null) return null;
        Set<TVSeasonEntity> tvSeasons = movie.getTvSeasons();
        return MovieConvert.toSimpleTvSeasonDto(tvSeasons);
    }
}
