package com.website.movie.service.impl;

import com.website.movie.helper.converter.MovieConvert;
import com.website.movie.persistence.entity.MovieEntity;
import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.persistence.repository.MovieRepository;
import com.website.movie.service.IMovieService;
import com.website.movie.web.dto.MovieDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

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
            for (TVSeasonEntity seasonEntity: e.getSeasons()) {
                seasonEntity.getRates().size();
            }
            movieDtos.add(MovieConvert.toDto(e));
        });
        return movieDtos;
    }

    @Override
    public MovieEntity updateMovie(MovieEntity movieEntity) {
        return movieRepository.save(movieEntity);
    }

    @Override
    public MovieEntity createMovie(MovieEntity movieEntity) {
        return movieRepository.save(movieEntity);
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
    public List<MovieEntity> scrapingMovieData(String URL, String container) {

        return null;
    }
}
