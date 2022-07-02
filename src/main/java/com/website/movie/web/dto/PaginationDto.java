package com.website.movie.web.dto;

import lombok.Data;

@Data
public class PaginationDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 11/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private Integer maxPageItem; // all item in one page
    private Integer nextPage; // next page
    private Integer maxPage; // total page of all item in database can cal
    private Long maxItems; // all items found

    public PaginationDto(){

    }

    public PaginationDto(Integer maxPageItem, Integer nextPage, Integer maxPage) {
        this.maxPageItem = maxPageItem;
        this.nextPage = nextPage;
        this.maxPage = maxPage;
    }

    public PaginationDto(Integer maxPageItem, Integer nextPage, Integer maxPage, Long maxItems) {
        this.maxPageItem = maxPageItem;
        this.nextPage = nextPage;
        this.maxPage = maxPage;
        this.maxItems = maxItems;
    }
}
