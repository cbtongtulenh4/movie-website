package com.website.movie.service;

import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.security.MyUserPrincipal;
import com.website.movie.web.dto.UserDto;
import com.website.movie.web.dto.UserLoginDto;

public interface IUserService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    UserEntity registerNewUserAccount(UserDto accountDto);

    UserEntity saveRegisteredUser(final UserEntity user);

    UserEntity save(UserEntity userEntity);

    UserEntity findByEmail(String email);

    UserEntity changeUserPassword(UserEntity user, String newPassword);

    MyUserPrincipal loadUserByEmail(UserLoginDto userLogin);

    String checkLoadUser(MyUserPrincipal myUser);

}
