package com.website.movie.service.impl;

import com.website.movie.persistence.entity.MovieGenresEntity;
import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.persistence.repository.TVSeasonRepository;
import com.website.movie.service.ITvSeasonService;
import com.website.movie.web.dto.MovieFilterDto;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

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
    private TVSeasonRepository tvSeasonRepository;

    @Override
    public TVSeasonEntity createSeasonMovie(TVSeasonEntity tvSeason) {
        return tvSeasonRepository.save(tvSeason);
    }

    @Override
    public TVSeasonEntity getSeasonMovieById(Long id) {
        return tvSeasonRepository.findById(id).orElse(null);
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
        tvSeasons.forEach(e -> {
            if(!seasonMovieFilter(e, movieFilter)){
                tvSeasons.remove(e);
            }
        });
        return tvSeasons;
    }

    @SneakyThrows
    private boolean seasonMovieFilter(TVSeasonEntity tvSeason, MovieFilterDto movieFilter){
        // use reflection in java
        // can use java.beans package: https://stackoverflow.com/questions/3333974/how-to-loop-over-a-class-attributes-in-java
        Class<?> aClass = movieFilter.getClass();
        Field[] fieldsFilter = aClass.getDeclaredFields();
        for (Field field : fieldsFilter){
            field.setAccessible(true);
            if (field.get(movieFilter) != null){
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

    private boolean genresFilter(List<MovieGenresEntity> origin, String[] request){
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




}
