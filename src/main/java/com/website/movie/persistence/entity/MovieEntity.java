package com.website.movie.persistence.entity;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "movie")
public class MovieEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 26/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String title;
    private String thumbnail;
    private Float rate;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(
            name = "movie_id",
            foreignKey = @ForeignKey(name = "movie_tv_season")
    )
    private List<TVSeasonEntity> seasons;
    @ManyToMany(targetEntity = MovieCategoryEntity.class, fetch = FetchType.LAZY)
    @JoinTable(
            name = "movie_category",
            joinColumns = {
                    @JoinColumn(name = "movie_id")
            },
            inverseJoinColumns = {
                    @JoinColumn(name = "category_id")
            }
    )
    private List<MovieCategoryEntity> categories;

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

    public List<TVSeasonEntity> getSeasons() {
        return seasons;
    }

    public void setSeasons(List<TVSeasonEntity> seasons) {
        this.seasons = seasons;
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
