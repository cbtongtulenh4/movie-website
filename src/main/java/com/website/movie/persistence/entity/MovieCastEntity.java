package com.website.movie.persistence.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.*;

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

    private String name;

//    @ManyToMany(mappedBy = "casts")
//    private List<TVSeasonEntity> tvSeasons = new ArrayList<>();

}
