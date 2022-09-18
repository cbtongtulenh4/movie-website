package com.website.movie.helper.converter;

import com.website.movie.constant.SystemConstants;
import com.website.movie.persistence.entity.ProfileEntity;
import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.utils.ArrayUtil;
import com.website.movie.utils.AssertUtil;
import com.website.movie.web.dto.UserDto;
import com.website.movie.web.dto.UserProfileDto;

import java.util.*;

public class UserConvert {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    public static UserDto toDTO(UserEntity entity) {
//        if(entity == null) return null;
        AssertUtil.notNull(entity, "UserEntity must not be null!");
        UserDto result = new UserDto();
        result.setUsername(entity.getUsername());
        result.setId(entity.getId());
        result.setPassword(entity.getPassword());
        return result;
    }

    public static UserEntity toEntity(UserDto dto){
//        if(dto == null) return null;
        AssertUtil.notNull(dto, "UserDto must not be null!");
        UserEntity result = new UserEntity();
        result.setUsername(dto.getUsername());
        result.setPassword(dto.getPassword());
        ProfileEntity profileEntity = new ProfileEntity();
        profileEntity.setEmail(dto.getEmail());
        if(profileEntity.getAvatar() == null) profileEntity.setAvatar(ArrayUtil.randValue(SystemConstants.AVATAR_ID));
        result.setProfile(profileEntity);
        return result;
    }

    public static UserProfileDto toUserProfileDto(UserEntity userEntity){
        AssertUtil.notNull(userEntity, "UserEntity must not null!");
        UserProfileDto userProfileDto = Convert.convertModel(userEntity.getProfile(), UserProfileDto.class);
        userProfileDto.setUsername(userEntity.getUsername());
        userProfileDto.setId(userEntity.getId());
        return userProfileDto;
    }

    public static List<UserProfileDto> toListUserProfileDto(Collection<UserEntity> userEntities){
        if (userEntities.isEmpty()) return null;
        List<UserProfileDto> rs = new ArrayList<>();
        for (UserEntity user : userEntities){
            rs.add(toUserProfileDto(user));
        }
        return rs;
    }


}
