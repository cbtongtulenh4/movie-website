package com.website.movie.persistence.repository;

import com.website.movie.persistence.entity.MovieDirectorEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MovieDirectorRepository extends JpaRepository<MovieDirectorEntity, Long> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 02/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */
}
