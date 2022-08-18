package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "movie_character")
@Data
public class MovieCharacterEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 30/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String name;

//    @ManyToOne
//    @JsonBackReference(value = "cast-character")
//    @EqualsAndHashCode.Exclude @ToString.Exclude
//    private MovieCastEntity cast;

    @ManyToOne
    @JsonBackReference(value = "tvSeason-character")
    @EqualsAndHashCode.Exclude @ToString.Exclude
    private TVSeasonEntity tvSeason;

}
