package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "movie")
@Data
public class MovieEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 26/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String code;
    private String title;
    private String thumbnail;
    private Float rate;

//    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
////    @JoinColumn(
////            name = "movie_id",
////            foreignKey = @ForeignKey(name = "movie_tv_season")
////    )
//    private List<TVSeasonEntity> seasons = new ArrayList<>();
    @OneToMany(mappedBy = "movie", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonManagedReference(value = "movie-tvSeason")
    @EqualsAndHashCode.Exclude @ToString.Exclude
//    @Fetch(value = FetchMode.SUBSELECT)
    private Set<TVSeasonEntity> tvSeasons = new HashSet<>();

    @ManyToMany(targetEntity = MovieCategoryEntity.class, cascade = CascadeType.ALL)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    @JsonIgnore
    @JoinTable(
            name = "movie_category",
            joinColumns = {
                    @JoinColumn(name = "movie_id")
            },
            inverseJoinColumns = {
                    @JoinColumn(name = "category_id")
            }
    )
    private Set<MovieCategoryEntity> categories = new HashSet<>();

    public MovieEntity(){
        this.rate = 0F;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public Float getRate() {
        return rate;
    }

    public void setRate(Float rate) {
        this.rate = rate;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Set<TVSeasonEntity> getTvSeasons() {
        return tvSeasons;
    }

    public void setTvSeasons(Set<TVSeasonEntity> tvSeasons) {
        this.tvSeasons = tvSeasons;
    }

    public Set<MovieCategoryEntity> getCategories() {
        return categories;
    }

    public void setCategories(Set<MovieCategoryEntity> categories) {
        this.categories = categories;
    }

    @Override
    public int hashCode(){
        final int prime = 31;
        int result = 17;
        result = prime * result + ((getRate() == null) ? 0 : getRate().hashCode());
        result = prime * result + ((getThumbnail() == null) ? 0 : getThumbnail().hashCode());
        result = prime * result + ((getTitle() == null) ? 0 : getTitle().hashCode());
        return result;
    }



}
