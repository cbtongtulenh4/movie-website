package com.website.movie.service.impl;

import com.website.movie.persistence.entity.MovieCategoryEntity;
import com.website.movie.persistence.repository.MovieCategoryRepository;
import com.website.movie.service.IMovieCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MovieCategoryService implements IMovieCategoryService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 02/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private MovieCategoryRepository movieCategoryRepository;

    @Override
    public MovieCategoryEntity createMovieCategory(MovieCategoryEntity movieCategory) {
        return movieCategoryRepository.save(movieCategory);
    }

}
