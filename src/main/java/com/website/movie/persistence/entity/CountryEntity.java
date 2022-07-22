package com.website.movie.persistence.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
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

    @Column(nullable = false, unique = true)
    private String code;
    private String name;

    @OneToMany(mappedBy = "country", 
            cascade = CascadeType.ALL,
            orphanRemoval = true, fetch = FetchType.LAZY
    )
    @EqualsAndHashCode.Exclude @ToString.Exclude
    java.util.List<TVSeasonEntity> tvSeasons = new ArrayList<>();

    public CountryEntity(){

    }

    public CountryEntity(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public CountryEntity(Long id, String code, String name) {
        super(id);
        this.code = code;
        this.name = name;
    }
}
