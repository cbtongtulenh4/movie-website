package com.website.movie.persistence.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.ArrayList;

@Entity
@Table(name = "countries")
@Data
public class CountryEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 28/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String name;
//    @ManyToMany(mappedBy = "countries")
//    java.util.List<TVSeasonEntity> tvSeasons = new ArrayList<>();

}
