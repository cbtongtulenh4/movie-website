package com.website.movie.persistence.repository;

import com.website.movie.persistence.entity.RateEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RateRepository extends JpaRepository<RateEntity, Long> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 29/05/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    List<RateEntity> findAllByTvSeason(Long seasonId);

    @Query(value = "SELECT * FROM rate WHERE tvSeason_id = :id", nativeQuery = true)
    List<RateEntity> findAllByTvSeasonId(@Param("id") Long seasonId);

}
