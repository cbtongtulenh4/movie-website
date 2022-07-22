package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "category")
@Data
public class MovieCategoryEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 26/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String code;
    private String name;

    public MovieCategoryEntity(){

    }

    public MovieCategoryEntity(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public MovieCategoryEntity(long id,String code, String name) {
        super(id);
        this.code = code;
        this.name = name;
    }


    @EqualsAndHashCode.Exclude @ToString.Exclude
    @ManyToMany(mappedBy = "categories", cascade = CascadeType.ALL)
    @JsonIgnore
    List<MovieEntity> movies = new ArrayList<>();

}
