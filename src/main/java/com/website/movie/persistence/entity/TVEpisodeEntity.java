package com.website.movie.persistence.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "tv_episodes")
@Data
public class TVEpisodeEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 30/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String title;
    private Float runtime;
    private String summary;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(
            name = "tv_season_id",
            nullable = false,
            foreignKey =  @ForeignKey(name = "tv_season_episode")

    )
    private TVSeasonEntity tvSeason;

}
