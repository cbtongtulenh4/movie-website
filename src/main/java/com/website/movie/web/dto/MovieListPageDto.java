package com.website.movie.web.dto;

import lombok.Data;

import java.util.List;

@Data
public class MovieListPageDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 15/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private List<SimpleTvSeasonDto> simpleTvSeasons;
    private PaginationDto pagination;

    public MovieListPageDto(){

    }

    public MovieListPageDto(List<SimpleTvSeasonDto> simpleTvSeasons, PaginationDto pagination){
        this.simpleTvSeasons = simpleTvSeasons;
        this.pagination = pagination;
    }

}
