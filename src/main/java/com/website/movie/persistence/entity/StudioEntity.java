package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
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

    @Column(nullable = false, unique = true, length = 50)
    private String code;
    private String name;


    @ManyToMany(mappedBy = "studios", fetch = FetchType.LAZY)
    @JsonIgnore
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
