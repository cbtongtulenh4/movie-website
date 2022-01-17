package com.website.movie.persistence.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "users")
@AllArgsConstructor
@Setter
@Getter
public class UserEntity extends BaseEntity {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String email;
    private String password;
    private String name;
    private String gender;
    private Boolean enable;
    private Boolean status;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "user_role",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
    )
    private List<RoleEntity> roles = new ArrayList<>();

    public UserEntity(){
        super();

        this.enable = false;
        this.status = true;
    }


    @Override
    public int hashCode(){
        // The 17 and 31 hash code idea is from the classic Java Book - effective Java: item 9
        final int prime = 31;
        int result = 17;// can choice a diff value - ex: 1
        result = prime * result + ((getEmail() == null) ? 0 : getEmail().hashCode());
        result = prime * result + ((getGender() == null) ? 0 : getGender().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getPassword() == null) ? 0 : getPassword().hashCode());
        return  result;
    }

//    @Override
//    public String toString(){
//        return Objects.toString(this);
//    }
    @Override
    public String toString(){
        return "Role[ \n" +
//                "Id: " + id + "\n" +
                "Email: " + email +"\n" +
                "Password: " + password + "\n" +
                "Name: " + name + "\n" +
                "Gender: " + gender + "\n" +
                "Enable: " + enable + "\n" +
                "Status: " + status + "\n" +
        "]";
    }



}
