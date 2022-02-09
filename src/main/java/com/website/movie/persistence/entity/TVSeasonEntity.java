package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import javax.persistence.*;

import java.util.*;

@Entity
@Table(name = "Movie_Seasons")
@NoArgsConstructor
@AllArgsConstructor
@Data
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
    private String showtime;
    private String directors;
    private Integer followers;
    private Integer ageLimit;
    private Float rate;
    private Long views;
    @Column(columnDefinition = "TEXT")
    private String summary;
    private Integer seasonNumber;
/*
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(
            name = "form_id",
            foreignKey = @ForeignKey(name = "FK_TV_SEASON_FORM")
    )
    private MovieFormEntity movieForm;
*/
    @OneToMany(mappedBy = "tvSeason", fetch = FetchType.EAGER)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    @JsonManagedReference
    private Set<TVEpisodeEntity> episodes = new HashSet<>();

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonBackReference
    @EqualsAndHashCode.Exclude @ToString.Exclude
    @JoinColumn(
            name = "movie_id",
            nullable = false,
            foreignKey = @ForeignKey(name = "movie_tv_season")
    )
    private MovieEntity movie;

    @ManyToMany(targetEntity = MovieGenresEntity.class, fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    @JsonIgnore
    @JoinTable(
            name = "season_genre",
            joinColumns = {
                    @JoinColumn(name = "season_id")
            },
            inverseJoinColumns = {
                    @JoinColumn(name = "genre_id")
            }
    )
    private List<MovieGenresEntity> genres = new ArrayList<>();
/*
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
    private List<CountryEntity> countries = new ArrayList<>();
    @ManyToMany(targetEntity = SubtitleEntity.class, cascade = CascadeType.ALL)
    @JoinTable(
            name = "tv_season_subtitle",
            joinColumns = {
                    @JoinColumn(name = "tv_season_id")
            },
            inverseJoinColumns = {
                    @JoinColumn(name = "subtitle_id")
            }
    )
    private List<SubtitleEntity> subtitles = new ArrayList<>();
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
    private List<LanguageEntity> languages = new ArrayList<>();
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
    private List<MovieCastEntity> casts = new ArrayList<>();
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
    private List<MovieCrewEntity> crews = new ArrayList<>();

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "tv_season_id")
    private List<CommentEntity> comments = new ArrayList<>();
 */
}
