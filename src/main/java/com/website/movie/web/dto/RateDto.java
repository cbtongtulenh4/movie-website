package com.website.movie.web.dto;

import lombok.Data;


@Data
public class RateDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 12/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private float value;
    private int numPeople;

    public RateDto(){
        this.value = 10;
        this.numPeople = 0;
    }

    public RateDto(float value, int numPeople){
        this.value = value;
        this.numPeople = numPeople;
    }


}
