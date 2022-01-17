package com.website.movie.service;

import com.website.movie.persistence.entity.RoleEntity;

public interface IRoleService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    RoleEntity addNewRole(String code, String name);

}
