package com.website.movie.persistence.dao.impl;

import com.website.movie.persistence.dao.IVerificationTokenDAO;
import com.website.movie.persistence.entity.VerificationTokenEntity;
import org.springframework.stereotype.Repository;

@Repository
public class VerificationTokenImpl extends AbstractDAO<VerificationTokenEntity>
implements IVerificationTokenDAO {

    @Override
    public void deleteAllByUserId(long userId) {
        String sql = "DELETE FROM emailtoken WHERE user_id = ?";
        delete(sql, userId);
    }
}
