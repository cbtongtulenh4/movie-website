package com.website.movie.persistence.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "seasons")
public class SeasonEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 30/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String name;
    private Integer year;

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
            if (other.getYear() != null){
                return false;
            }
        }
        return true;
    }

}
