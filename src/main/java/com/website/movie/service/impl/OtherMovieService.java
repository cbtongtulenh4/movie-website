package com.website.movie.service.impl;

import com.website.movie.persistence.entity.MovieGenresEntity;
import com.website.movie.persistence.repository.MovieGenresRepository;
import com.website.movie.service.IOtherMovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OtherMovieService implements IOtherMovieService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 09/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private MovieGenresRepository movieGenresRepository;

    @Override
    public MovieGenresEntity saveGenreMovie(MovieGenresEntity genreMovie) {
        return movieGenresRepository.save(genreMovie);
    }

    @Override
    public void deleteGenresMovie(long[] ids) {
        for (long id : ids){
            movieGenresRepository.deleteById(id);
        }
    }

    @Override
    public MovieGenresEntity findOneGenreMovieById(long id) {
        return movieGenresRepository.findById(id).orElse(null);
    }

    @Override
    public List<MovieGenresEntity> findAllGenreMovie() {
        return movieGenresRepository.findAll();
    }

}
