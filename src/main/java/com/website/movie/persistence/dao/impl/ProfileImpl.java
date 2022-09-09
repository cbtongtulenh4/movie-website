package com.website.movie.persistence.dao.impl;

import com.website.movie.persistence.dao.IProfileDAO;
import com.website.movie.persistence.entity.ProfileEntity;
import org.springframework.stereotype.Repository;

@Repository
public class ProfileImpl extends AbstractDAO<ProfileEntity> implements IProfileDAO {
    @Override
    public void saveAvatarById(long id, String avatar) {
        String sql = "UPDATE profile SET avatar = ? WHERE id = ?";
        update(sql, avatar, id);
    }
}
