package com.website.movie.persistence.dao;

import com.website.movie.persistence.entity.CommentEntity;

public interface ICommentDAO {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 01/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    void saveCommentEntity(final Long cmId, final Long cmParentId, final Long tvSeasonId);

    java.util.List<CommentEntity> findAllByParentIdAndTvSeasonId(final Long cmParentId, final Long tvSeasonId);

    void updateNumLikeById(final int numLike, final long commentId);

    void updateSpamById(final int spam, final long commentId);

}
