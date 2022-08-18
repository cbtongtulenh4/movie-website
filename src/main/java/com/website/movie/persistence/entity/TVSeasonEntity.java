package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import javax.persistence.*;
import java.util.*;


@Entity
@Table(name = "movie_seasons")
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Data
public class TVSeasonEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 29/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Column(nullable = false, unique = true, length = 50)
    private String code;
    private String title;
    private String thumbnail;
    private Integer newEpisode;
    private Float cost = 0.0F;
    private Integer duration = 0;
    private String status;
    private String showtime;
    private Integer followers = 0;
    private Integer ageLimit = 0;
    private String trailer;
//    private Float rate = 10.0F;
    private Long views = 0L;
    @Column(columnDefinition = "TEXT")
    private String summary;
    private Integer seasonNumber; // season th of movie
//    private LocalDate release; // date for release



    @ManyToOne
    @JoinColumn(name = "season_id")
    private SeasonEntity season;

    @ManyToOne
    @JoinColumn(name = "country_id")
    private CountryEntity country;

/*
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(
            name = "form_id",
            foreignKey = @ForeignKey(name = "FK_TV_SEASON_FORM")
    )
    private MovieFormEntity movieForm;
*/

    @ManyToMany(cascade = {
            CascadeType.MERGE, CascadeType.REFRESH
    }, fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    private Set<StudioEntity> studios = new HashSet<>();

    @OneToMany(mappedBy = "tvSeason", fetch = FetchType.LAZY)
    @JsonManagedReference(value = "season-movie-rate")
    @EqualsAndHashCode.Exclude @ToString.Exclude
    private Set<RateEntity> rates = new HashSet<>();

    @OneToMany(mappedBy = "tvSeason", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    @JsonManagedReference(value = "season-movie-episode")
    private Set<TVEpisodeEntity> episodes = new TreeSet<>(Comparator.comparingInt(TVEpisodeEntity::getNumEp));

    @OneToMany(mappedBy = "tvSeason", cascade = {
            CascadeType.PERSIST,
            CascadeType.MERGE, CascadeType.REFRESH
    }, fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    @JsonManagedReference(value = "tvSeason-character")
    private Set<MovieCharacterEntity> characters = new HashSet<>();

    @ManyToOne
    @JsonBackReference(value = "movie-tvSeason")
    @EqualsAndHashCode.Exclude @ToString.Exclude
    @JoinColumn(
            name = "movie_id",
            foreignKey = @ForeignKey(name = "movie_tv_season")
    )
    private MovieEntity movie;

    @ManyToMany(cascade = {
            CascadeType.MERGE, CascadeType.REFRESH
    }, fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    @JoinTable(
            name = "season_genre",
            joinColumns = @JoinColumn(name = "season_id"),
            inverseJoinColumns = @JoinColumn(name = "genre_id")
    )
    private Set<MovieGenresEntity> genres = new HashSet<>();

    @ManyToMany(cascade = {
            CascadeType.MERGE,CascadeType.REFRESH
    }, fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    @JoinTable(
            name = "season_rating",
            joinColumns = @JoinColumn(name = "season_id"),
            inverseJoinColumns = @JoinColumn(name = "rating_id")
    )
    private Set<RatingEntity> ratings = new HashSet<>();

    @OneToMany(targetEntity = CommentEntity.class,
            cascade = CascadeType.ALL, fetch = FetchType.LAZY
    )
    @JoinColumn(name = "cm_season_id", referencedColumnName = "id")
    private Set<CommentEntity> comments = new HashSet<>();

    @ManyToMany(cascade = {
            CascadeType.MERGE, CascadeType.REFRESH
    }, fetch = FetchType.LAZY)
    @JoinTable(
            name = "tv_season_language",
            joinColumns = @JoinColumn(name = "tv_season_id"),
            inverseJoinColumns = @JoinColumn(name = "language_id")
    )
    private Set<LanguageEntity> languages = new HashSet<>();

    @ManyToMany(cascade = {
            CascadeType.MERGE,CascadeType.REFRESH
    }, fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    private Set<MovieCastEntity> cast = new HashSet<>();

    @ManyToMany(cascade = {
            CascadeType.MERGE,CascadeType.REFRESH
    }, fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    private Set<MovieDirectorEntity> directors = new HashSet<>();


    public void removeGenres(final long genresId){
        MovieGenresEntity genres = this.genres.stream().filter(e -> e.getId() == genresId).findFirst().orElse(null);
        if (genres != null){
            genres.getTvSeasons().remove(this);
            this.genres.remove(genres);
        }
    }

    public void removeLanguage(final long languageId){
        LanguageEntity language = this.languages.stream().filter(e -> e.getId() == languageId).findFirst().orElse(null);
        if (language != null){
            language.getTvSeasons().remove(this);
            this.languages.remove(language);
        }
    }

    public void removeRating(final long ratingId){
        RatingEntity rating = this.ratings.stream().filter(e -> e.getId() == ratingId).findFirst().orElse(null);
        if (rating != null){
            rating.getTvSeasons().remove(this);
            this.ratings.remove(rating);
        }
    }

    public void removeCast(final long castId){
        MovieCastEntity castEntity = this.cast.stream().filter(e -> e.getId() == castId).findFirst().orElse(null);
        if (castEntity != null){
            castEntity.getTvSeasons().remove(this);
            this.cast.remove(castEntity);
        }
    }

    public void removeDirector(final long directorId){
        MovieDirectorEntity directorEntity = this.directors.stream().filter(e -> e.getId() == directorId).findFirst().orElse(null);
        if (directorEntity != null){
            directorEntity.getTvSeasons().remove(this);
            this.directors.remove(directorEntity);
        }
    }

    public void addGenres(final MovieGenresEntity genres){
        this.genres.add(genres);
        genres.getTvSeasons().add(this);
    }

    /*
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
 */
}
