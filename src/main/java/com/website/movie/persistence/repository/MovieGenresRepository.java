package com.website.movie.persistence.repository;

import com.website.movie.persistence.entity.MovieGenresEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MovieGenresRepository extends JpaRepository<MovieGenresEntity, Long> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 02/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    MovieGenresEntity findByName(String name);

//    @Query("INSERT IGNORE INTO MovieGenresEntity(code, name) values(:genres)")
//    List<MovieGenresEntity> saveAllInsertIgnore(@Param("genres") List<MovieGenresEntity> genres);

}
