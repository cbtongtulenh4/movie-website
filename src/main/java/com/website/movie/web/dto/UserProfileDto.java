package com.website.movie.web.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserProfileDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private Long id;
    private String name;
    private String email;
    private String avatar;
    private String firstName;
    private String lastName;
    private Integer age;
    private String gender;
    private String country;
    private String state;


}
