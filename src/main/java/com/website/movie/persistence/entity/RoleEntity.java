package com.website.movie.persistence.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Objects;

@Entity
@Table(name = "roles")
@AllArgsConstructor
@NoArgsConstructor
public class RoleEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String code;
    private String name;

    @ManyToMany(mappedBy = "roles")
    private java.util.List<UserEntity> users = new ArrayList<>();

    public RoleEntity(final String code,final String name){
        super();

        this.code = code;
        this.name = name;
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

    @Override
    public int hashCode(){
        // The 17 and 31 hash code idea is from the classic Java Book - effective Java: item 9
        final int prime = 31;
        int result = 17;// can choice a diff value - ex: 1
        result = prime * result + ((getCode() == null) ? 0 : getCode().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        return  result;
    }

    @Override
    public String toString(){
        return "Role[ \n" +
//                "Id: " + id + "\n" +
                "Code: " + code +"\n" +
                "Name: " + name + "\n" +
        "]";
    }
}
