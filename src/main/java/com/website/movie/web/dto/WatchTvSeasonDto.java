package com.website.movie.web.dto;

import com.website.movie.persistence.entity.TVEpisodeEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import java.util.Set;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class WatchTvSeasonDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 07/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private Long id;
    @NotNull
    private String code;
    @NotNull
    private String title;
    private String thumbnail;
    private String duration;
    private String showtime;
    private Integer ageLimit;
    private Float rate;
    private Long views;
    private String summary;
    private Long movie_id;

    private Set<TVEpisodeEntity> episodes;
}
