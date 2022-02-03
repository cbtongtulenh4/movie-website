package com.website.movie.web.api;

import com.website.movie.helper.converter.Convert;
import com.website.movie.helper.error.InvalidDataException;
import com.website.movie.persistence.entity.MovieCategoryEntity;
import com.website.movie.service.IMovieCategoryService;
import com.website.movie.web.dto.MovieCategoryDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController(value = "OtherRestAPI")
public class OtherRestController {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 02/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private IMovieCategoryService movieCategoryService;

    private static final Logger LOGGER = LoggerFactory.getLogger(OtherRestController.class);

    @PostMapping(value = "/api/movie/category")
    public MovieCategoryDto createMovieCategory(
            @RequestBody @Valid final MovieCategoryDto movieCategoryDto,
            final BindingResult result)
    {
        LOGGER.info("Create a movie category with information: {}", movieCategoryDto);
        if (result.hasErrors()){
            throw new InvalidDataException(result);
        }
        MovieCategoryEntity movieCategoryEntity = Convert.convertModel(movieCategoryDto, MovieCategoryEntity.class);
        movieCategoryEntity = movieCategoryService.createMovieCategory(movieCategoryEntity);
        return Convert.convertModel(movieCategoryEntity, MovieCategoryDto.class);
    }

}
