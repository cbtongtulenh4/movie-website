package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "rating")
@NoArgsConstructor
@AllArgsConstructor
@Data
public class RatingEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 10/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String code;
    private String name;

    public RatingEntity(String code, String name){
        this.code = code;
        this.name = name;
    }

    @ManyToMany(mappedBy = "ratings", fetch = FetchType.LAZY)
    @JsonIgnore
    @EqualsAndHashCode.Exclude @ToString.Exclude
    Set<TVSeasonEntity> tvSeasons = new HashSet<>();

    public void closeTvSeasons(){
        tvSeasons.forEach(tvSeason -> {
            tvSeason.getRatings().remove(this);
        });
    }

}
