package com.website.movie.persistence.repository;

import com.website.movie.persistence.entity.TVSeasonEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TVSeasonRepository extends JpaRepository<TVSeasonEntity, Long> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 02/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

//    List<TVSeasonEntity> findAllByRate()
    TVSeasonEntity findOneByCode(String code);

    @Query(value = "SELECT * FROM movie_seasons ORDER BY ?1 ?2 LIMIT ?3", nativeQuery = true)
    List<TVSeasonEntity> findLimitPopularByViews(String filed, String sort, int limit);

    @Query(value = "SELECT sm.* FROM movie_seasons as sm INNER JOIN rate on sm.id = rate.tvSeason_id " +
            "GROUP BY(sm.id) ORDER BY SUM(rate.value) ?1 LIMIT ?2,?3", nativeQuery = true)
    List<TVSeasonEntity> findLimitPopularByRate(String sort, int offset, int limit);

    @Query(value = "SELECT sm.* FROM movie_seasons as sm INNER JOIN rate on sm.id = rate.tvSeason_id " +
            "GROUP BY(sm.id) ORDER BY SUM(rate.value) :direction LIMIT 0, 2", nativeQuery = true)
    List<TVSeasonEntity> findLimitPopularByRate(@Param("direction") String sort);

    @Query("SELECT DISTINCT ms FROM TVSeasonEntity ms " +
            "LEFT JOIN FETCH ms.genres " +
            "LEFT JOIN FETCH ms.rates " +
            "LEFT JOIN FETCH ms.episodes " +
            "LEFT JOIN FETCH ms.directors " +
            "LEFT JOIN FETCH ms.studios " +
            "LEFT JOIN FETCH ms.languages " +
            "LEFT JOIN FETCH ms.comments WHERE ms.id = :id")
    TVSeasonEntity findByIdAndFetchAllEagerly(@Param("id") Long id);

    @Query("SELECT ms.code FROM TVSeasonEntity ms WHERE ms.id = ?1")
    String getTitleById(long id);

//    @Query("UPDATE TVSeasonEntity SET :name = :value WHERE id = :id")
//    void saveAttributeCustomize(@Param("id") Long id, @Param("name") String name, @Param("value") String value);

    Page<TVSeasonEntity> findAllByMovie_id(long movieId, Pageable pageable);



}
