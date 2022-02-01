package com.website.movie.web.dto;

import com.website.movie.persistence.entity.MovieCategoryEntity;

import java.util.List;

public class MovieDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 01/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private Long id;
    private String title;
    private String thumbnail;

    private List<TVSeasonDto> seasons;
    private List<MovieCategoryEntity> categories;

}
