package com.website.movie.web.dto;

import lombok.Data;

import java.util.List;

@Data
public class MovieListPageDto<T> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 15/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private List<T> tvSeasons;
    private PaginationDto pagination;

    public MovieListPageDto(){

    }

    public MovieListPageDto(List<T> tvSeasons, PaginationDto pagination){
        this.tvSeasons = tvSeasons;
        this.pagination = pagination;
    }

    public List<T> getTvSeasons() {
        return tvSeasons;
    }

    public void setTvSeasons(List<T> tvSeasons) {
        this.tvSeasons = tvSeasons;
    }

    public PaginationDto getPagination() {
        return pagination;
    }

    public void setPagination(PaginationDto pagination) {
        this.pagination = pagination;
    }
}
