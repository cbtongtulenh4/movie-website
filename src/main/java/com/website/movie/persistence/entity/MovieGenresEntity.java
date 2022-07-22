package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.hibernate.annotations.SQLInsert;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "movie_genres")
@SQLInsert(sql = "INSERT IGNORE INTO movie_genres(code, name) VALUES(?, ?)")
@Data
public class MovieGenresEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 27/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @NotNull
    @Column(unique = true, nullable = false)
    private String code;
    @NotNull
    private String name;

    @ManyToMany(mappedBy = "genres", fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    @JsonIgnore
    List<TVSeasonEntity> tvSeasons = new ArrayList<>();
}
