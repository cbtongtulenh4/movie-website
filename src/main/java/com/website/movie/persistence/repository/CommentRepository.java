package com.website.movie.persistence.repository;

import com.website.movie.persistence.entity.CommentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.*;

public interface CommentRepository extends JpaRepository<CommentEntity, Long> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 02/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Query(value = "SELECT * FROM comment WHERE cm_parent_id = :cmParentId AND cm_season_id = :tvSeasonId", nativeQuery = true)
    List<CommentEntity> findByParentIdAndTvSeasonId(@Param(value = "cmParentId") Long cmParentId,@Param(value = "tvSeasonId") Long tvSeasonId);

    @Query(value = "UPDATE comment SET cm_like = cm_like + 1 WHERE id = 2", nativeQuery = true)
    int updateNumLikeById(int numLike, long id);

    @Query(value = "SELECT cm_like FROM comment WHERE id = ?1", nativeQuery = true)
    int getLikeById(long id);


}
