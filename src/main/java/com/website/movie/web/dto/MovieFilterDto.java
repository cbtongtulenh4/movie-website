package com.website.movie.web.dto;

import lombok.Data;

@Data
public class MovieFilterDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 09/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String title;
    private String rating;
    private String[] genres;

    public MovieFilterDto(){

    }

    public MovieFilterDto(String title, String rating, String[] genres){
        this.title = title;
        this.rating = rating;
        this.genres = genres;
    }

}
