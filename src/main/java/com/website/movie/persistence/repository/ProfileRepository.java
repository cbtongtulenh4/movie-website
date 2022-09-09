package com.website.movie.persistence.repository;

import com.website.movie.persistence.entity.ProfileEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProfileRepository extends JpaRepository<ProfileEntity, Long> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Query(value = "UPDATE profile SET avatar = ?1 WHERE id = ?2", nativeQuery = true)
    void saveAvatarById(String avatar, long id);

}
