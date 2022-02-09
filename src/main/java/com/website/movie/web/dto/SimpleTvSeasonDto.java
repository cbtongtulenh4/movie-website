package com.website.movie.web.dto;

import com.website.movie.persistence.entity.TVEpisodeEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class SimpleTvSeasonDto extends TVSeasonAbstractDto{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 08/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private Long id;

    private String title;
    private String summary;
    private String runtime;
    private String duration;
    private Long views;

    public void initValue(
            Set<TVEpisodeEntity> episodes,
            Integer duration
    ){
        int epSize = episodes.size();
        this.duration = setDuration(duration, epSize);
    }

}
