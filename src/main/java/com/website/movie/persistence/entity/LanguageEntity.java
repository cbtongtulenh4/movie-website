package com.website.movie.persistence.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

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

    public LanguageEntity(){

    }

    public LanguageEntity(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public LanguageEntity(Long id, String code, String name) {
        super(id);
        this.code = code;
        this.name = name;
    }

    //    @ManyToMany(mappedBy = "languages")
//    java.util.List<TVSeasonEntity> tvSeasons = new ArrayList<>();

}
