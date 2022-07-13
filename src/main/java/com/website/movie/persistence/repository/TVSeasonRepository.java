package com.website.movie.persistence.repository;

import com.website.movie.persistence.entity.TVSeasonEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TVSeasonRepository extends JpaRepository<TVSeasonEntity, Long> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 02/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

//    List<TVSeasonEntity> findAllByRate()
    TVSeasonEntity findOneByCode(String code);

    @Query("SELECT DISTINCT ms FROM TVSeasonEntity ms " +
            "LEFT JOIN FETCH ms.genres " +
            "LEFT JOIN FETCH ms.rates " +
            "LEFT JOIN FETCH ms.episodes " +
            "LEFT JOIN FETCH ms.comments WHERE ms.id = :id")
    TVSeasonEntity findByIdAndFetchAllEagerly(@Param("id") Long id);

}
