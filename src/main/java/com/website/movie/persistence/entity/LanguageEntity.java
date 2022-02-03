package com.website.movie.persistence.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.ArrayList;

@Entity
@Table(name = "languages")
@Data
public class LanguageEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 26/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String code;
    private String name;

//    @ManyToMany(mappedBy = "languages")
//    java.util.List<TVSeasonEntity> tvSeasons = new ArrayList<>();

}
