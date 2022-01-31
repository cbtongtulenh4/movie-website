package com.website.movie.persistence.entity;

import javax.persistence.*;

import java.util.*;

@Entity
@Table(name = "Movie_Seasons")
public class TVSeasonEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 29/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

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
    @Column(columnDefinition = "TEXT")
    private String summary;
    private Integer seasonNumber;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(
            name = "form_id",
            foreignKey = @ForeignKey(name = "FK_TV_SEASON_FORM")
    )
    private MovieFormEntity movieForm;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "episode_id")
    private List<TVEpisodeEntity> episodes;
    @ManyToMany(targetEntity = MovieGenresEntity.class, fetch = FetchType.LAZY)
    @JoinTable(
            name = "season_genre",
            joinColumns = {
                    @JoinColumn(name = "season_id")
            },
            inverseJoinColumns = {
                    @JoinColumn(name = "genre_id")
            }
    )
    private List<MovieGenresEntity> genres;
    @ManyToMany(targetEntity = CountryEntity.class, cascade = CascadeType.ALL)
    @JoinTable(
            name = "tv_season_country",
            joinColumns = {
                    @JoinColumn(name = "tv_season_id")
            },
            inverseJoinColumns = {
                    @JoinColumn(name = "country_id")
            }
    )
    private List<CountryEntity> countries;
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(
            name = "subtitle_id",
            foreignKey = @ForeignKey(name = "FK_TV_SEASON_SUBTITLE")
    )
    private List<SubtitleEntity> subtitles;
    @ManyToMany(targetEntity = LanguageEntity.class, fetch = FetchType.LAZY)
    @JoinTable(
            name = "tv_season_language",
            joinColumns = {
                    @JoinColumn(name = "tv_season_id")
            },
            inverseJoinColumns = {
                    @JoinColumn(name = "language_id")
            }
    )
    private List<LanguageEntity> languages;
    @ManyToMany(targetEntity = MovieCastEntity.class, fetch = FetchType.EAGER)
    @JoinTable(
            name = "tv_season_cast",
            joinColumns = {
                    @JoinColumn(name = "tv_season_id")
            },
            inverseJoinColumns = {
                    @JoinColumn(name = "cast_id")
            }
    )
    private List<MovieCastEntity> casts;
    @ManyToMany(targetEntity = MovieCrewEntity.class, fetch = FetchType.LAZY)
    @JoinTable(
            name = "tv_season_crew",
            joinColumns = {
                    @JoinColumn(name = "tv_season_id")
            },
            inverseJoinColumns = {
                    @JoinColumn(name = "crew_id")
            }
    )
    private List<MovieCrewEntity> crews;

}
