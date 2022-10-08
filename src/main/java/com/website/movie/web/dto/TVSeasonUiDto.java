package com.website.movie.web.dto;

import com.website.movie.persistence.entity.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
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
    @NotNull
    private String code;
    @NotNull
    private String title;
    private String thumbnail;
    private String duration;
    private Float cost = 0F;
    private String status;
    private String showtime;
    private String runtime;
    private String quality;
    private Integer followers;
    private Integer ageLimit = 0;
    private Long views = 0L;
    private String summary;
    private Integer seasonNumber;
    private String release;
    private Long movie_id;
    private boolean isPaid = false;
    private boolean isFav = false;
    private List<String> photos;
    private List<VideoEntity> videos;

    private RateDto rate;
    private int[] newEpisode;
    private String[] genres;
    private CountryEntity country;
    private Set<StudioEntity> studios;
    private Set<LanguageEntity> languages;
    private Set<MovieDirectorEntity> directors;

    public void initValue(
            Set<TVEpisodeEntity> episodes,
            Set<MovieGenresEntity> genres,
            Set<RateEntity> rates,
            Integer duration,
            SeasonEntity season
    ){
        int epSize = episodes.size();
        this.newEpisode = setNewEpisode(epSize);
        this.duration = setDuration(duration, epSize);
        this.genres = setGenres(genres);
        this.rate = calRate(rates);
        this.release = season.getName() + "-" + season.getYear();
    }


}
