package com.website.movie.persistence.repository;


import com.website.movie.persistence.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */
    UserEntity findOneByUsername(String username);
    UserEntity findByUsernameAndPassword(String username, String password);
    void deleteByUsername(String username);

    @Query("SELECT user.password FROM UserEntity user WHERE user.id = ?1")
    String findPasswordById(long id);
}
