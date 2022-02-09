package com.website.movie.web.dto;

import com.website.movie.persistence.entity.CountryEntity;
import com.website.movie.persistence.entity.LanguageEntity;
import com.website.movie.persistence.entity.MovieGenresEntity;
import com.website.movie.persistence.entity.TVEpisodeEntity;
import lombok.*;

import java.util.List;
import java.util.Set;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TVSeasonUiDto extends TVSeasonAbstractDto{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 07/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */


    private Long id;

    private String title;
    private String thumbnail;
    private int[] newEpisode;
    private String duration;
    private String status;
    private String showtime;
    private String quality;
    private String directors;
    private Integer followers;
    private Integer ageLimit;
    private Float rate;
    private Long views;
    private String summary;
    private Integer seasonNumber;

    @EqualsAndHashCode.Exclude @ToString.Exclude
    private Set<MovieGenresEntity> genres;

    @EqualsAndHashCode.Exclude @ToString.Exclude
    private Set<CountryEntity> countries;

    @EqualsAndHashCode.Exclude @ToString.Exclude
    private List<LanguageEntity> languages;

    public void initValue(
            Set<TVEpisodeEntity> episodes,
            Integer duration
    ){
        int epSize = episodes.size();
        this.newEpisode = setNewEpisode(epSize);
        this.duration = setDuration(duration, epSize);
    }


}
