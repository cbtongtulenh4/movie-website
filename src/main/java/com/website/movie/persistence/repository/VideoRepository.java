package com.website.movie.persistence.repository;

import com.website.movie.persistence.entity.VideoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VideoRepository extends JpaRepository<VideoEntity, Long> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 01/07/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */
}
