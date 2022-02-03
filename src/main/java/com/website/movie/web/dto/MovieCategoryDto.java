package com.website.movie.web.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class MovieCategoryDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 02/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private Long id;
    @NotNull(message = "code field is not null")
    private String code;
    @NotNull(message = "name field is not null")
    private String name;

}
