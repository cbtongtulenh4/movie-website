package com.website.movie.web.dto;

import com.website.movie.persistence.entity.MovieCategoryEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MovieDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 01/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private Long id;
    @NotNull
    private String title;
    private String thumbnail;
    private Float rate;

    private List<TVSeasonDto> seasons = new ArrayList<>();
    private List<MovieCategoryEntity> categories = new ArrayList<>();

}
