package com.website.movie.service;

import com.website.movie.persistence.entity.ProfileEntity;
import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.security.MyUserPrincipal;
import com.website.movie.utils.custom.CustomPageable;
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

    void saveUserProfileDto(UserProfileDto userProfileDto);

    void saveAvatarProfileCustom(long profileId, String avatar);

    UserEntity findByUsername(String username);

    UserProfileDto findById(Long id);

    UserEntity findUserEntityById(Long id);

    List<UserProfileDto> getAllUser();

    List<SimpleTvSeasonDto> getAllFavoriteMovie(String email);

    void appendFavoriteMovie(final long user_id, final long tvSeason_id);

    void deleteFavoriteMovie(final long user_id, final long tvSeason_id);

    void savePaidSeasonMovie(final long user_id, final long tvSeason_id);

    void saveAllPaidSeasonMovie(final long user_id, final long[] tvSeason_ids);

    CustomPageable<SimpleTvSeasonDto> getAllPaidSeasonMovie(final long id, int pageNo, int limitMovie);

    UserEntity changeUserPassword(UserEntity user, String newPassword);

    MyUserPrincipal loadUserByUsername(UserLoginDto userLogin);

    String checkLoadUser(MyUserPrincipal myUser);

    void deleteUserAccount(final String email);

    boolean validChangePassword(String originalPassword, String storedPassword);

}
