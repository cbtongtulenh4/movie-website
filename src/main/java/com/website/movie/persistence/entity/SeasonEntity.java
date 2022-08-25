package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "seasons")
public class SeasonEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 30/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Column(nullable = false, unique = true, length = 100)
    private String code;
    private String name;
    private Integer year;

    @OneToMany(mappedBy = "season",
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY, orphanRemoval = true
    )
    @JsonIgnore
    @EqualsAndHashCode.Exclude @ToString.Exclude
    private Set<TVSeasonEntity> tvSeasons = new HashSet<>();

    public SeasonEntity(){

    }

    public SeasonEntity(String code, String name, Integer year) {
        this.code = code;
        this.name = name;
        this.year = year;
    }

    public SeasonEntity(Long id, String code, String name, Integer year) {
        super(id);
        this.code = code;
        this.name = name;
        this.year = year;
    }


    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    @Override
    public int hashCode(){
        int result = 17;
        int prime = 31;
        result = prime * result + ((getName() != null) ? getName().hashCode() : 0);
        result = prime * result + ((getYear() != null) ? getYear().hashCode() : 0);
        return result;
    }

    @Override
    public boolean equals(Object obj){
        if (obj == this){
            return true;
        }
        if (obj == null){
            return false;
        }
        if (obj.getClass() != getClass()){
            return false;
        }
        SeasonEntity other = (SeasonEntity) obj;
        if(getName() == null){
            if (other.getName() != null){
                return false;
            }
        }
        if (getYear() == null){
            return other.getYear() == null;
        }
        return true;
    }

}
