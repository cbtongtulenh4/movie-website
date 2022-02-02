package com.website.movie.persistence.repository;

import com.website.movie.persistence.entity.MovieCastEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MovieCastRepository extends JpaRepository<MovieCastEntity, Long> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 02/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */
}
