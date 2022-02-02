package com.website.movie.service.impl;

import com.website.movie.persistence.entity.MovieEntity;
import com.website.movie.persistence.repository.MovieRepository;
import com.website.movie.service.IMovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class MovieService implements IMovieService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 01/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private MovieRepository movieRepository;

    @Override
    public MovieEntity getMovieById(Long id) {
        return null;
    }

    @Override
    public List<MovieEntity> getMovies() {
        return movieRepository.findAll();
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

}
