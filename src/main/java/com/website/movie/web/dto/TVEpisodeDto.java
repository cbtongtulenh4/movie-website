package com.website.movie.web.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TVEpisodeDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 05/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @NotNull
    private String title;
    @NotNull
    private String path;
    private Float runtime;
    private String summary;
    @NotNull
    private Long season_id;

}
