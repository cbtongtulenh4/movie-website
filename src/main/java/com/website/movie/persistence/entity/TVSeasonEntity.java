package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import javax.persistence.*;

import java.util.*;

@EqualsAndHashCode(callSuper = true)
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

    private String code;
    private String title;
    private String thumbnail;
    private Integer newEpisode;
    private Float cost = 0.0F;
    private Integer duration = 0;
    private String status;
    private String showtime;
    private String directors;
    private Integer followers = 0;
    private Integer ageLimit = 0;
//    private Float rate = 10.0F;
    private Long views = 0L;
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

    @OneToMany(mappedBy = "tvSeason", fetch = FetchType.LAZY)
    @JsonManagedReference(value = "season-movie-rate")
    @EqualsAndHashCode.Exclude @ToString.Exclude
    private Set<RateEntity> rates = new HashSet<>();


    @OneToMany(mappedBy = "tvSeason", fetch = FetchType.EAGER)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    @JsonManagedReference(value = "season-movie-episode")
    private Set<TVEpisodeEntity> episodes = new TreeSet<>(Comparator.comparingInt(TVEpisodeEntity::getNumEp));
//    private Set<TVEpisodeEntity> episodes = new TreeSet<>(Comparator.comparingInt(TVEpisodeEntity::getNumEp));

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonBackReference(value = "movie-season")
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
    private Set<MovieGenresEntity> genres = new HashSet<>();




    @ManyToMany(targetEntity = RatingEntity.class, fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    @JsonIgnore
    @JoinTable(
            name = "season_rating",
            joinColumns = {
                    @JoinColumn(name = "season_id")
            },
            inverseJoinColumns = {
                    @JoinColumn(name = "rating_id")
            }
    )
    private Set<RatingEntity> ratings = new HashSet<>();

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "cm_season_id", referencedColumnName = "id")
    private Set<CommentEntity> comments = new HashSet<>();


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
