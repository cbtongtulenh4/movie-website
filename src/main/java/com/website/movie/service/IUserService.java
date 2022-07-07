package com.website.movie.service;

import com.website.movie.persistence.entity.ProfileEntity;
import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.security.MyUserPrincipal;
import com.website.movie.web.dto.*;

import java.util.*;

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

    ProfileEntity save(ProfileEntity profileEntity);

    UserEntity findByUsername(String username);

    UserProfileDto findById(Long id);

    List<UserProfileDto> getAllUser();

    List<TVSeasonUiDto> getAllFavoriteMovie(String email);

    void appendFavoriteMovie(final long user_id, final long tvSeason_id);

    void savePaidSeasonMovie(final long user_id, final long tvSeason_id);

    List<SimpleTvSeasonDto> getAllPaidSeasonMovie(final Long id);

    UserEntity changeUserPassword(UserEntity user, String newPassword);

    MyUserPrincipal loadUserByUsername(UserLoginDto userLogin);

    String checkLoadUser(MyUserPrincipal myUser);

    void deleteUserAccount(final String email);

    boolean validChangePassword(String originalPassword, String storedPassword);

}
