package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.HashSet;
import java.util.Set;

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

    @ManyToMany(mappedBy = "languages")
    @EqualsAndHashCode.Exclude @ToString.Exclude
    @JsonIgnore
    private Set<TVSeasonEntity> tvSeasons = new HashSet<>();


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
}
