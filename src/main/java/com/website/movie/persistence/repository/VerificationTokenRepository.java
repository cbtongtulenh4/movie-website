package com.website.movie.persistence.repository;

import com.website.movie.persistence.entity.VerificationTokenEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface VerificationTokenRepository extends JpaRepository<VerificationTokenEntity, Long> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */
    VerificationTokenEntity findByToken(String token);

    @Query(value = "DELETE FROM emailtoken WHERE user_id = :userId", nativeQuery = true)
    void deleteAllByUserId(@Param(value = "userId")long userId);
}
