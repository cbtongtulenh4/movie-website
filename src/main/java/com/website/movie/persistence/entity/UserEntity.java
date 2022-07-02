package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "users")
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

    @ManyToMany(fetch = FetchType.EAGER)
    @JsonIgnore
    @JoinTable(
            name = "user_role",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
    )
    private List<RoleEntity> roles = new ArrayList<>();

    @ManyToMany(targetEntity = TVSeasonEntity.class, fetch = FetchType.LAZY)
    @JsonIgnore
    @JoinTable(
            name = "user_tv_season",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "tv_season_id")
    )
    private Set<TVSeasonEntity> tvSeasons = new HashSet<>();


    @ManyToMany(targetEntity = TVSeasonEntity.class, fetch = FetchType.LAZY)
    @JsonIgnore
    @JoinTable(
            name = "paid_movie",
            joinColumns = @JoinColumn(
                    name = "user_id"
//                    foreignKey = @ForeignKey(name = "user_FK")
            ),
            inverseJoinColumns = @JoinColumn(
                    name = "tvSeason_id"
//                    foreignKey = @ForeignKey(name = "tvSeason_FK")
            )
    )
    private Set<TVSeasonEntity> paidMovies = new HashSet<>();

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    @JsonIgnore
    private Set<RateEntity> rates = new HashSet<>();


    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "profile_id")
    private ProfileEntity profile = new ProfileEntity();


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
        UserEntity other = (UserEntity) obj;
        if(getRoles() == null){
            if (other.getRoles() != null){
                return false;
            }
        }
        if(getPassword() == null){
            if (other.getPassword() != null){
                return false;
            }
        }
        if(getName() == null){
            if (other.getName() != null){
                return false;
            }
        }
        if(getGender() == null){
            if (other.getGender() != null){
                return false;
            }
        }
        if(getEmail() == null){
            if (other.getEmail() != null){
                return false;
            }
        }
        return true;
    }

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
