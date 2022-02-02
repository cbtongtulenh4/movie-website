package com.website.movie.persistence.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import java.util.*;

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

    @ManyToMany(mappedBy = "categories")
    List<MovieEntity> movies = new ArrayList<>();

}
