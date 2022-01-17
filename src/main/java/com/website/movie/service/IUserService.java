package com.website.movie.service;

import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.web.dto.UserDto;

public interface IUserService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    UserEntity registerNewUserAccount(UserDto accountDto);

    UserEntity saveRegisteredUser(final UserEntity user);

    public UserEntity save(UserEntity userEntity);

    UserEntity findByEmail(String email);

}
