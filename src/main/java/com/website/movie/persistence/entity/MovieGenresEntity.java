package com.website.movie.persistence.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "movie_genres")
@Data
public class MovieGenresEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 27/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String code;
    private String name;

//    @ManyToMany(mappedBy = "genres")
//    List<TVSeasonEntity> tvSeasons = new ArrayList<>();
}
