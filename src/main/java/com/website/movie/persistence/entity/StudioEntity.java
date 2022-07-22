package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;


@Entity
@Table(name = "studio")
@EqualsAndHashCode(callSuper = true)
@Data
public class StudioEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 30/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Column(nullable = false, unique = true)
    private String code;
    private String name;


    @ManyToMany(mappedBy = "studios", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonBackReference
    @EqualsAndHashCode.Exclude @ToString.Exclude
    private Set<TVSeasonEntity> tvSeason = new HashSet<>();

    public StudioEntity(){

    }

    public StudioEntity(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public StudioEntity(Long id, String code, String name) {
        super(id);
        this.code = code;
        this.name = name;
    }
}
