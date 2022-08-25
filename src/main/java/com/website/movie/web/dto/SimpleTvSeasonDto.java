package com.website.movie.web.dto;

import com.website.movie.persistence.entity.LanguageEntity;
import com.website.movie.persistence.entity.RateEntity;
import com.website.movie.persistence.entity.SeasonEntity;
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

    private String code;
    private String title;
    private String thumbnail;
    private String trailer;
    private String summary;
    private String runtime;
    private String duration;
    private Float rate = 10.0F;
    private Long views;
    private Integer year;
    private String release;
    private String languages;

    public void initValue(
            Set<TVEpisodeEntity> episodes,
            Integer duration,
            SeasonEntity season,
            Set<RateEntity> rates,
            Set<LanguageEntity> languages
    ){
        int epSize = episodes.size();
        this.duration = setDuration(duration, epSize);
        this.year = season.getYear();
        this.release = season.getName() + "-" + season.getYear();
        StringBuilder str = new StringBuilder();
        languages.forEach(e -> str.append(e.getName()).append(", "));
        this.languages = str.toString();
        this.rate = calRate(rates);

//        this.views = new DecimalFormat("###,###,###").format(this.views);
    }

}
