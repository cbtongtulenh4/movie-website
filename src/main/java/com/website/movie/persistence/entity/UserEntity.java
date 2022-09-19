package com.website.movie.persistence.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.HashSet;
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

    private String username;
    private String password;
    private Boolean enable;
    private Boolean status;

    @ManyToMany(fetch = FetchType.EAGER)
    @EqualsAndHashCode.Exclude @ToString.Exclude
    private Set<RoleEntity> roles = new HashSet<>();

    @ManyToMany(targetEntity = TVSeasonEntity.class, fetch = FetchType.LAZY)
    @JoinTable(
            name = "favorite_movie",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "tvSeason_id")
    )
    @EqualsAndHashCode.Exclude @ToString.Exclude
    private Set<TVSeasonEntity> favoriteMovies = new HashSet<>();

    @ManyToMany(targetEntity = TVSeasonEntity.class, fetch = FetchType.LAZY)
    @JoinTable(
            name = "paid_movie",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "tvSeason_id")
    )
    private Set<TVSeasonEntity> paidMovies = new HashSet<>();

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    @JsonManagedReference(value = "user-rate")
    @EqualsAndHashCode.Exclude @ToString.Exclude
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
        result = prime * result + ((getUsername() == null) ? 0 : getUsername().hashCode());
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
        if(getUsername() == null){
            return other.getUsername() == null;
        }
        return true;
    }

    @Override
    public String toString(){
        return "Role[ \n" +
//                "Id: " + id + "\n" +
                "Password: " + password + "\n" +
                "Name: " + username + "\n" +
                "Enable: " + enable + "\n" +
                "Status: " + status + "\n" +
        "]";
    }



}
