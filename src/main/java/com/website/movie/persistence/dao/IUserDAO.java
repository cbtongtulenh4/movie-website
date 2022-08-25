package com.website.movie.persistence.dao;

import com.website.movie.persistence.entity.UserEntity;

public interface IUserDAO extends GenericDAO<UserEntity> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 18/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */


    void appendFavoriteMovieSeason(final Long user_id, final Long tvSeason_id);

    void deleteFavoriteMovieSeason(final Long user_id, final Long tvSeason_id);

    void savePaidSeasonMovie(final Long user_id, final Long tvSeason_id);

    boolean checkPaidSeasonMovie(final Long user_id, final Long tvSeason_id);

}
