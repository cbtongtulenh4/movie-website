package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "movie_cast")
@Data
public class MovieCastEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 30/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */


    private String code;
    private String name;
    @ElementCollection
    private List<String> photos = new ArrayList<>();

//    @ManyToMany(mappedBy = "casts")
//    private List<TVSeasonEntity> tvSeasons = new ArrayList<>();

//    @OneToMany(mappedBy = "cast", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//    @JsonManagedReference(value = "cast-character")
//    @EqualsAndHashCode.Exclude @ToString.Exclude
//    private List<MovieCharacterEntity> characters = new ArrayList<>();

    @ManyToMany(mappedBy = "cast", fetch = FetchType.LAZY)
    @JsonIgnore
    @EqualsAndHashCode.Exclude @ToString.Exclude
    private Set<TVSeasonEntity> tvSeasons;

}
