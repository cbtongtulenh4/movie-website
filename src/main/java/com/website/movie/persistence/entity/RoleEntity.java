package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.HashSet;

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

    @ManyToMany(mappedBy = "roles",fetch = FetchType.LAZY)
    @JsonIgnore
    @ToString.Exclude @EqualsAndHashCode.Exclude
    private java.util.Set<UserEntity> users = new HashSet<>();

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
        RoleEntity other = (RoleEntity) obj;
        if (getName() == null){
            if (other.getName() != null){
                return false;
            }
        }
        if (getCode() == null){
            if (other.getCode() != null){
                return false;
            }
        }
        return true;
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
