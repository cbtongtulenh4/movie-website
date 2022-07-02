package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;

@Entity(name = "rate")
@Table(name = "rate")
@Data
public class RateEntity extends BaseEntity {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 24/05/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */


    private int value;

    @ManyToOne(fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    @JsonBackReference(value = "season-movie-rate")
    @JoinColumn(
            name = "tvSeason_id",
            nullable = false,
            foreignKey = @ForeignKey(name = "tvSeason_rate")
    )
    private TVSeasonEntity tvSeason;

    @ManyToOne(fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    @JsonBackReference(value = "user-rate")
    @JoinColumn(
            name = "user_id",
            nullable = false,
            foreignKey = @ForeignKey(name = "user_rate")
    )
    private UserEntity user;

    public RateEntity(){

    }

    public RateEntity(int value, UserEntity user, TVSeasonEntity tvSeason){
        super();
        this.value = value;
        this.user = user;
        this.tvSeason = tvSeason;
    }

}
