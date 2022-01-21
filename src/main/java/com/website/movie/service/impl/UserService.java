package com.website.movie.service.impl;


import com.website.movie.encoder.PasswordEncoder;
import com.website.movie.helper.converter.UserConvert;
import com.website.movie.helper.error.UserAlreadyExistException;
import com.website.movie.persistence.entity.RoleEntity;
import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.persistence.repository.RoleRepository;
import com.website.movie.persistence.repository.UserRepository;
import com.website.movie.service.IUserService;
import com.website.movie.web.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.net.URLEncoder;

@Service
@Transactional
public class UserService implements IUserService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */


    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public UserEntity registerNewUserAccount(UserDto accountDto) {
        if(emailExists(accountDto.getEmail())){
            throw new UserAlreadyExistException("There is an account with that email address: "
                        + accountDto.getEmail()
            );
        }
//        accountDto.setPassword(passwordEncoder.hashPBKDF2(accountDto.getPassword()));
        UserEntity user = UserConvert.toEntity(accountDto);
        RoleEntity role = roleRepository.findByName("user");
        user.getRoles().add(role);
        return userRepository.save(user);
    }

    @Override
    public UserEntity saveRegisteredUser(UserEntity user) {
        return userRepository.save(user);
    }

    private boolean emailExists(String email) {
        return userRepository.findOneByEmail(email) != null;
    }


    @Override
    public UserEntity save(UserEntity userEntity) {
        return userRepository.save(userEntity);
    }

    @Override
    public UserEntity findByEmail(String email) {
        return userRepository.findOneByEmail(email);
    }

}
