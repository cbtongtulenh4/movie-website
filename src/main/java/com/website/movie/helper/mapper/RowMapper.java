package com.website.movie.helper.mapper;

import java.sql.ResultSet;

public interface RowMapper<T> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 18/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    T mapRow(ResultSet rs);
}
