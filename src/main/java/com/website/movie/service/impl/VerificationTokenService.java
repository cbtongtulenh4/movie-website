package com.website.movie.service.impl;


import com.website.movie.persistence.dao.IVerificationTokenDAO;
import com.website.movie.persistence.dao.impl.VerificationTokenImpl;
import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.persistence.entity.VerificationTokenEntity;
import com.website.movie.persistence.repository.VerificationTokenRepository;
import com.website.movie.service.IVerificationTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;

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

    private final IVerificationTokenDAO verificationTokenDAO = new VerificationTokenImpl();

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
//        if(isExistToken(token)) vTokenRepository.deleteByToken(token);
        VerificationTokenEntity vTokenEntity = vTokenRepository.findByToken(token);
        if (vTokenEntity != null) vTokenRepository.delete(vTokenEntity);
        final VerificationTokenEntity vToken = new VerificationTokenEntity(token, user);
        vTokenRepository.save(vToken);
    }

    /**
     * check validate verification token
     * @param vTokenEntity
     * @return
     */
    @Override
    public String validateVerificationToken(VerificationTokenEntity vTokenEntity) {
        return !isFoundToken(vTokenEntity) ? "invalidToken"
                : isTokenExpired(vTokenEntity) ? "expired"
                : null;
    }

    @Override
    public VerificationTokenEntity findByToken(String token) {
        return vTokenRepository.findByToken(token);
    }

    @Override
    public VerificationTokenEntity saveVerificationTokenEntity(VerificationTokenEntity verificationToken) {
        return vTokenRepository.save(verificationToken);
    }

    @Override
    public void deleteById(long id) {
        vTokenRepository.deleteById(id);
    }

    @Override
    public void deleteVerificationTokenEntity(VerificationTokenEntity verificationToken) {
        vTokenRepository.delete(verificationToken);
    }

    @Override
    public void deleteAllByUserId(long userId) {
        verificationTokenDAO.deleteAllByUserId(userId);
    }

    private boolean isFoundToken(VerificationTokenEntity vTokenEntity){
        return vTokenEntity != null;
    }

    private boolean isTokenExpired(VerificationTokenEntity vTokenEntity){
        Calendar cal = Calendar.getInstance();
        return vTokenEntity.getExpiryDate().before(cal.getTime());
    }

    private boolean isExistToken(String token){
        return vTokenRepository.findByToken(token) != null;
    }
}
