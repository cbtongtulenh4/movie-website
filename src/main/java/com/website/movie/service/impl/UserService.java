package com.website.movie.service.impl;


import com.website.movie.constant.SystemConstants;
import com.website.movie.encoder.PasswordEncoder;
import com.website.movie.helper.converter.UserConvert;
import com.website.movie.helper.error.UserAlreadyExistException;
import com.website.movie.helper.error.UserNotFoundException;
import com.website.movie.persistence.entity.RoleEntity;
import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.persistence.repository.RoleRepository;
import com.website.movie.persistence.repository.UserRepository;
import com.website.movie.security.MyUserPrincipal;
import com.website.movie.service.IUserService;
import com.website.movie.web.dto.UserDto;
import com.website.movie.web.dto.UserLoginDto;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        accountDto.setPassword(passwordEncoder.hashPBKDF2(accountDto.getPassword()));
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

    @Override
    public UserEntity changeUserPassword(UserEntity user, String newPassword) {
        user.setPassword(passwordEncoder.hashPBKDF2(newPassword));
        return userRepository.save(user);
    }

    @SneakyThrows
    @Override
    public MyUserPrincipal loadUserByEmail(UserLoginDto userLogin) {
        UserEntity user = userRepository.findOneByEmail(userLogin.getEmail());
        if (user == null){
            new UserNotFoundException("No user found with email:" + userLogin.getEmail());
        }
        MyUserPrincipal myUser = null;
        if(passwordEncoder.validatePassPBKDF2(userLogin.getPassword(), user.getPassword())){
             myUser = new MyUserPrincipal(user);
        }
        return myUser;
    }

    @Override
    public String checkLoadUser(MyUserPrincipal myUser) {
        if(myUser == null){
            return "loginFailure";
        }
        if (!myUser.isAccountNonExpired()){
            return "AccountExpired";
        }
        if (!myUser.isAccountNonLocked()){
            return "AccountLocked";
        }
        if (!myUser.isCredentialsNonExpired()){
            return "CredentialsExpired";
        }
        if (!myUser.isEnable()){
            return "NotEnable";
        }
        return SystemConstants.SUCCESS;
    }


}
