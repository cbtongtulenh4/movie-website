package com.website.movie.service;

import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.persistence.entity.VerificationTokenEntity;


public interface IVerificationTokenService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    VerificationTokenEntity getVerificationToken(final String vToken);

    UserEntity getUser(String verificationToken);

    void createVerificationTokenForUser(final UserEntity user,final String token);

    String validateVerificationToken(VerificationTokenEntity vTokenEntity);

    VerificationTokenEntity findByToken(String token);

    VerificationTokenEntity saveVerificationTokenEntity(VerificationTokenEntity verificationToken);

    void deleteById(long id);

    void deleteVerificationTokenEntity(VerificationTokenEntity verificationToken);

    void deleteAllByUserId(long userId);
}
