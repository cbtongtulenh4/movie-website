package com.website.movie.web.dto;

import com.website.movie.persistence.entity.MovieGenresEntity;
import com.website.movie.persistence.entity.RateEntity;
import com.website.movie.persistence.entity.TVEpisodeEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
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
    @NotNull
    private String code;
    @NotNull
    private String title;
    private String thumbnail;
    private String duration;
    private Float cost = 0F;
    private String status;
    private String showtime;
    private String quality;
    private String directors;
    private Integer followers;
    private Integer ageLimit = 0;
    private Float rate = 10.0F;
    private Long views = 0L;
    private String summary;
    private Integer seasonNumber;
    private Long movie_id;
    private boolean isPaid = false;

    private int[] newEpisode;
    private String[] genres;
    private String[] countries;
    private String[] languages;

    public void initValue(
            Set<TVEpisodeEntity> episodes,
            Set<MovieGenresEntity> genres,
            Set<RateEntity> rates,
            Integer duration
    ){
        int epSize = episodes.size();
        this.newEpisode = setNewEpisode(epSize);
        this.duration = setDuration(duration, epSize);
        this.genres = setGenres(genres);
        this.rate = calRate(rates);
    }


}
