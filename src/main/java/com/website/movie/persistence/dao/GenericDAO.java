package com.website.movie.persistence.dao;

import com.website.movie.helper.mapper.RowMapper;

public interface GenericDAO<T> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 18/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    //    list all object
    public java.util.List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters);

    //    update data
    public void update(String sql, Object... params);
    //    inset data
    public Long insert(String sql, Object... params);
    //     delete data
    public void delete(String sql, Object... params);

}
