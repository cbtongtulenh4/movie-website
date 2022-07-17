package com.website.movie.web.dto;

import lombok.Data;

@Data
public class ScrapingDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 05/03/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String url;
    private String container;

    public ScrapingDto(){

    }

    public ScrapingDto(final String url, final String container){
        this.url = url;
        this.container = container;
    }

}
