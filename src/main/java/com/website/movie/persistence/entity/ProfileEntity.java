package com.website.movie.persistence.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "profile")
@Data
public class ProfileEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */


    private String email;
    private Integer age;
    private String gender;
    private String country;
    private String state;
    private String avatar = "1TW5hzygr4wl4jJDL0qVOVuVnX1KKuSww";

}
