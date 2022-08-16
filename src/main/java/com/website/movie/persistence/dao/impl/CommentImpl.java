package com.website.movie.persistence.dao.impl;

import com.website.movie.persistence.dao.ICommentDAO;
import com.website.movie.persistence.entity.CommentEntity;

import java.util.List;

public class CommentImpl extends AbstractDAO<CommentEntity> implements ICommentDAO {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 01/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Override
    public void saveCommentEntity(Long cmId, Long cmParentId, Long tvSeasonId) {
        String sql = "UPDATE comments " +
                "SET cm_parent_id = ?, " +
                "cm_season_id = ? " +
                "WHERE id = ?";
        update(sql, cmParentId, tvSeasonId, cmId);
    }

    @Override
    public List<CommentEntity> findAllByParentIdAndTvSeasonId(Long cmParentId, Long tvSeasonId) {
        return null;
    }

    @Override
    public void updateNumLikeById(int numLike, long commentId) {
        String sql = "UPDATE comments SET cm_like = cm_like + ? WHERE id = ?";
        update(sql, numLike, commentId);
    }

    @Override
    public void updateSpamById(int spam, long commentId) {
        String sql = "UPDATE comments SET spam = spam + ? WHERE id = ?";
        update(sql, spam, commentId);
    }

}
