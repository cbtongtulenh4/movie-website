package com.website.movie.web.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
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

}
