package com.website.movie.service.impl;


import com.website.movie.constant.SystemConstants;
import com.website.movie.encoder.PasswordEncoder;
import com.website.movie.helper.converter.Convert;
import com.website.movie.helper.converter.MovieConvert;
import com.website.movie.helper.converter.UserConvert;
import com.website.movie.helper.error.UserAlreadyExistException;
import com.website.movie.helper.error.UserNotFoundException;
import com.website.movie.persistence.dao.IUserDAO;
import com.website.movie.persistence.dao.impl.UserImpl;
import com.website.movie.persistence.entity.ProfileEntity;
import com.website.movie.persistence.entity.RoleEntity;
import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.persistence.repository.ProfileRepository;
import com.website.movie.persistence.repository.RoleRepository;
import com.website.movie.persistence.repository.UserRepository;
import com.website.movie.security.MyUserPrincipal;
import com.website.movie.service.IUserService;
import com.website.movie.web.dto.*;
import lombok.SneakyThrows;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserService implements IUserService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */


    private final IUserDAO userDAO = new UserImpl();

    @Autowired
    UserRepository userRepository;

    @Autowired
    ProfileRepository profileRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    private static final Logger LOGGER = LoggerFactory.getLogger(UserService.class);

    @Override
    public UserEntity registerNewUserAccount(UserDto accountDto) {
        if(usernameExists(accountDto.getUsername())){
            throw new UserAlreadyExistException("There is an account with that username: "
                        + accountDto.getUsername()
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

    private boolean usernameExists(String username) {
        return userRepository.findOneByUsername(username) != null;
    }


    @Override
    public UserEntity save(UserEntity userEntity) {
        return userRepository.save(userEntity);
    }

    @Override
    public ProfileEntity save(ProfileEntity profileEntity){
        return profileRepository.save(profileEntity);
    }

    @Override
    public UserEntity findByUsername(String username) {
        return userRepository.findOneByUsername(username);
    }

    @Override
    public UserProfileDto findById(Long id){
        UserEntity userEntity = userRepository.findById(id).orElse(null);
        assert userEntity != null;
        return Convert.convertModel(userEntity.getProfile(), UserProfileDto.class);
    }

    @Override
    public List<UserProfileDto> getAllUser() {
        return UserConvert.toListUserProfileDto(userRepository.findAll());
    }

    @Override
    public List<TVSeasonUiDto> getAllFavoriteMovie(String username) {
        UserEntity userEntity = userRepository.findOneByUsername(username);
        LOGGER.info("Get favorite movie seasons with information: {}", userEntity.getTvSeasons());
//        LOGGER.info("Get genres season movie with information: {}", seasonEntity.getComments());
//        return MovieConvert.toDto(seasonEntity);
        return MovieConvert.toDto(userEntity.getTvSeasons());
    }

    @Override
    public void appendFavoriteMovie(long user_id, long tvSeason_id) {
        userDAO.appendFavoriteMovieSeason(user_id, tvSeason_id);
    }

    @Override
    public void savePaidSeasonMovie(long user_id, long tvSeason_id) {
        userDAO.savePaidSeasonMovie(user_id, tvSeason_id);
    }

    @Override
    public List<SimpleTvSeasonDto> getAllPaidSeasonMovie(Long id) {
        UserEntity userEntity = userRepository.findById(id).get();
        LOGGER.info("Get favorite movie seasons with information: {}", userEntity.getTvSeasons());
        return MovieConvert.toSimpleTvSeasonDto(userEntity.getTvSeasons());
    }

    @Override
    public UserEntity changeUserPassword(UserEntity user, String newPassword) {
        user.setPassword(passwordEncoder.hashPBKDF2(newPassword));
        return userRepository.save(user);
    }

    @SneakyThrows
    @Override
    public MyUserPrincipal loadUserByUsername(UserLoginDto userLogin) {
        UserEntity user = userRepository.findOneByUsername(userLogin.getUsername());
        if (user == null){
            throw new UserNotFoundException("No user found with username:" + userLogin.getUsername());
        }
        MyUserPrincipal myUser = null;
//        if(passwordEncoder.validatePassPBKDF2(userLogin.getPassword(), user.getPassword())){
//             myUser = new MyUserPrincipal(user);
//        }
//        myUser = new MyUserPrincipal(user);
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
//        if (!myUser.isEnable()){
//            return "NotEnable";
//        }
        return SystemConstants.SUCCESS;
    }

    @Override
    public void deleteUserAccount(final String username) {
        userRepository.deleteByUsername(username);
    }

    @SneakyThrows
    public boolean validChangePassword(String originalPassword, String storedPassword){
        return passwordEncoder.validatePassPBKDF2(originalPassword, storedPassword);
    }


}
