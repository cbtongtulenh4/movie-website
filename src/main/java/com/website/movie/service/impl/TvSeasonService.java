package com.website.movie.service.impl;

import com.website.movie.helper.converter.Convert;
import com.website.movie.persistence.entity.MovieEntity;
import com.website.movie.persistence.entity.MovieGenresEntity;
import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.persistence.repository.MovieGenresRepository;
import com.website.movie.persistence.repository.MovieRepository;
import com.website.movie.persistence.repository.TVSeasonRepository;
import com.website.movie.service.ITvSeasonService;
import com.website.movie.web.dto.MovieFilterDto;
import com.website.movie.web.dto.TVSeasonUiDto;
import lombok.SneakyThrows;
import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class TvSeasonService implements ITvSeasonService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 03/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
      */

    @Autowired
    private MovieRepository movieRepository;

    @Autowired
    private TVSeasonRepository tvSeasonRepository;

    @Autowired
    private MovieGenresRepository movieGenresRepository;

    private static final Logger LOGGER = LoggerFactory.getLogger(TvSeasonService.class);

    @Override
    public TVSeasonEntity createSeasonMovie(TVSeasonUiDto tvSeasonDto) {
        TVSeasonEntity tvSeasonEntity = Convert.convertModel(tvSeasonDto, TVSeasonEntity.class);
        MovieEntity movieEntity = movieRepository.findById(tvSeasonDto.getMovie_id()).orElse(null);
        tvSeasonEntity.setMovie(movieEntity);
        tvSeasonEntity.setGenres(setMovieGenresEntity(tvSeasonDto.getGenres()));
        return tvSeasonRepository.save(tvSeasonEntity);
    }

    @Override
    public TVSeasonEntity getSeasonMovieById(Long id) {
        TVSeasonEntity temp = tvSeasonRepository.findById(id).orElse(null);
//        LOGGER.info("Get a season movie with information: {}", temp);
//        if (temp != null){
//            TVSeasonEntity result = new TVSeasonEntity();
//            ModelMapper modelMapper = new ModelMapper();
//            result = modelMapper.map(temp, TVSeasonEntity.class);
//
//            result.setGenres(temp.getGenres());
////            LOGGER.info("Result of get a season movie with information: {}", result);
//            return result;
//        }
        // When add LOGGER.info so fetch LAZY type working, Why?
        LOGGER.info("Get genres season movie with information: {}", temp.getGenres());
        return temp;
    }

    @Override
    public List<TVSeasonEntity> getAllSeasonMovie() {
        return tvSeasonRepository.findAll();
    }

    @Override
    public long countSeasonMovie() {
        return tvSeasonRepository.count();
    }

    @Override
    public List<TVSeasonEntity> getSeasonMoviesByFilter(MovieFilterDto movieFilter) {
        List<TVSeasonEntity> tvSeasons = tvSeasonRepository.findAll();
        List<TVSeasonEntity> result = new ArrayList<>();
        tvSeasons.forEach(e -> {
            if(seasonMovieFilter(e, movieFilter)){
                result.add(e);
            }
        });
        return result;
    }

    @SneakyThrows
    private boolean seasonMovieFilter(TVSeasonEntity tvSeason, MovieFilterDto movieFilter){
        // use reflection in java
        // can use java.beans package: https://stackoverflow.com/questions/3333974/how-to-loop-over-a-class-attributes-in-java
        Class<?> aClass = movieFilter.getClass();
        // get can access to private, default, protect, public field
        Field[] fieldsFilter = aClass.getDeclaredFields();
        for (Field field : fieldsFilter){
            //
            field.setAccessible(true);
            // check value filed
            if (field.get(movieFilter) != null){
                // check field need to filter
                String choice = field.getName();
                switch (choice){
                    case "title":
                        if (!titleFilter(tvSeason.getTitle(), movieFilter.getTitle()))
                            return false;
                        break;
                    case "genres":
                        if (!genresFilter(tvSeason.getGenres(), movieFilter.getGenres()))
                            return false;
                        break;
                }
            }
        }
        return true;
    }

    private boolean genresFilter(Set<MovieGenresEntity> origin, String[] request){
        if (origin.size() < request.length) return false;
        List<String> genresTvSeason = new ArrayList<>();
        origin.forEach(e -> genresTvSeason.add(e.getName()));
        for (String genre : request){
            if (!genresTvSeason.contains(genre)){
                return false;
            }
        }
        return true;
    }

    private boolean titleFilter(String origin, String request){
        return origin.equals(request);
    }

    private Set<MovieGenresEntity> setMovieGenresEntity(String[] genresRequest){
        Set<MovieGenresEntity> result = new HashSet<>();
        for (String genreRequest : genresRequest){
            result.add(movieGenresRepository.findByName(genreRequest));
        }
        return result;
    }


}
