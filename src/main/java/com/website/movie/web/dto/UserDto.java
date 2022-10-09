package com.website.movie.web.dto;

import com.website.movie.persistence.entity.ProfileEntity;
import com.website.movie.persistence.entity.RoleEntity;
import lombok.Data;

import java.util.Set;

@Data
public class UserDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private Long id;
    private String username;
//    private String password;
    private Boolean enable;
    private Boolean status;

    private ProfileEntity profile;
    private Set<RoleEntity> roles;

    public UserDto() {

    }

    public UserDto(Long id, String username, Boolean enable, Boolean status) {
        this.id = id;
        this.username = username;
//        this.password = password;
        this.enable = enable;
        this.status = status;
    }
}
