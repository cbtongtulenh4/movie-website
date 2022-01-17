package com.website.movie.service.impl;


import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.persistence.entity.VerificationTokenEntity;
import com.website.movie.persistence.repository.VerificationTokenRepository;
import com.website.movie.service.IVerificationTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VerificationTokenService implements IVerificationTokenService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    VerificationTokenRepository vTokenRepository;

    @Override
    public VerificationTokenEntity getVerificationToken(String vToken) {
        return vTokenRepository.findByToken(vToken);
    }

    @Override
    public UserEntity getUser(String vToken) {
        VerificationTokenEntity verificationToken = vTokenRepository.findByToken(vToken);
        return verificationToken != null ? verificationToken.getUser() : null;
    }

    @Override
    public void createVerificationTokenForUser(final UserEntity user,final String token) {
        final VerificationTokenEntity vToken = new VerificationTokenEntity(token, user);
        vTokenRepository.save(vToken);
    }
}
