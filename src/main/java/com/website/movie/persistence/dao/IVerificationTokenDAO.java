package com.website.movie.persistence.dao;

import com.website.movie.persistence.entity.VerificationTokenEntity;

public interface IVerificationTokenDAO extends GenericDAO<VerificationTokenEntity> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 18/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    void deleteAllByUserId(long userId);


}
