package com.website.movie.persistence.dao.impl;

import com.website.movie.persistence.dao.IUserDAO;
import com.website.movie.persistence.entity.UserEntity;

public class UserImpl extends AbstractDAO<UserEntity> implements IUserDAO {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 18/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Override
    public void appendFavoriteMovieSeason(Long user_id, Long tvSeason_id) {
        insertSimpleTable("user_tv_season", user_id, tvSeason_id);
    }

    @Override
    public void savePaidSeasonMovie(Long user_id, Long tvSeason_id) {
        insertSimpleTable("paid_movie", user_id, tvSeason_id);
    }

    @Override
    public boolean checkPaidSeasonMovie(Long user_id, Long tvSeason_id) {
        String sql = "SELECT COUNT(*) FROM paid_movie WHERE user_id = ? AND tvSeason_id = ?";
        return count(sql, user_id, tvSeason_id) != 0;
    }

    private long insertSimpleTable(final String tableName, final long user_id, final long tvSeason_id){
        String sql = "INSERT INTO " + tableName + " VALUES(?, ?)";
        return insert(sql, user_id, tvSeason_id);
    }

}
