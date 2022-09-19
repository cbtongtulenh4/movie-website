package com.website.movie.persistence.repository;

import com.website.movie.persistence.entity.TVEpisodeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TVEpisodeRepository extends JpaRepository<TVEpisodeEntity, Long> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 02/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */


    @Query("UPDATE TVEpisodeEntity ep SET ep.path = ?2 WHERE ep.id = ?1")
    void savePathById(long id, String path);


}
