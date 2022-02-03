package com.website.movie.web.dto;

import com.website.movie.persistence.entity.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TVSeasonDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 01/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private Long id;

    private String title;
    private String thumbnail;
    private Integer newEpisode;
    private Integer duration;
    private String status;
    private String directors;
    private Integer followers;
    private Integer ageLimit;
    private Float rate;
    private Long views;
    private String summary;
    private Integer seasonNumber;
    @NotNull
    private Long movie_id;

    private MovieFormEntity movieForm;

    private List<TVEpisodeEntity> episodes;
//    private List<MovieGenresEntity> genres;
//    private List<CountryEntity> countries;
//    private List<SubtitleEntity> subtitles;
//    private List<LanguageEntity> languages;
//    private List<MovieCastEntity> casts;
//    private List<MovieCrewEntity> crews;
//    private List<CommentEntity> comments;

}
