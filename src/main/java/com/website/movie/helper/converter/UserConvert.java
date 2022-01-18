package com.website.movie.helper.converter;

import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.utils.AssertUtil;
import com.website.movie.web.dto.UserDto;

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
        result.setEmail(entity.getEmail());
        result.setId(entity.getId());
        result.setPassword(entity.getPassword());
        return result;
    }

    public static UserEntity toEntity(UserDto dto){
//        if(dto == null) return null;
        AssertUtil.notNull(dto, "UserDto must not be null!");
        UserEntity result = new UserEntity();
        result.setEmail(dto.getEmail());
        result.setPassword(dto.getPassword());
        return result;
    }


}
