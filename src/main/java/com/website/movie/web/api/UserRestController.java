package com.website.movie.web.api;

import com.website.movie.helper.converter.Convert;
import com.website.movie.helper.converter.UserConvert;
import com.website.movie.persistence.entity.ProfileEntity;
import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.service.IGoogleDriveService;
import com.website.movie.service.IOtherMovieService;
import com.website.movie.service.IUserService;
import com.website.movie.web.dto.TVSeasonUiDto;
import com.website.movie.web.dto.UserProfileDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController(value = "UserRestAPI")
public class UserRestController {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 31/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private IUserService userService;

    @Autowired
    private IOtherMovieService otherMovieService;

    @Autowired
    private IGoogleDriveService googleDriveService;

    @GetMapping(value = "/api/user/{id}")
    public UserProfileDto getUserById(
            @PathVariable final long id
    ){
        return userService.findById(id);
    }

    @GetMapping(value = "/api/user")
    public List<UserProfileDto> getAllUser(){
        return userService.getAllUser();
    }

    @PostMapping(value = "/api/user")
    public void createProfileUser(
            @RequestBody final UserProfileDto userProfileDto
    ){

    }

    @PutMapping(value = "/api/user")
    public void updateUser(
            @ModelAttribute("userProfile") final UserProfileDto userProfileDto
    ){
        UserEntity userEntity = userService.findByEmail(userProfileDto.getEmail());
        userEntity.setEmail(userProfileDto.getEmail());
        userEntity.setProfile(
                Convert.convertModel(userProfileDto, ProfileEntity.class)
        );
        userService.save(userEntity);
    }

    @PostMapping(value = "/api/user/avatar")
    public String updateUserAvatar(
            @RequestParam(value = "avatarNew") final MultipartFile avatarNew,
            @RequestParam(value = "avatarOld")final String avatarIdOld
    ){
        String avatarID = googleDriveService.uploadFile(avatarNew);
        googleDriveService.deleteFile(avatarIdOld);
        return avatarID;
    }


    @PutMapping(value = "/api/user/favorite")
    public void addFavoriteMovie(
            @RequestParam(value = "tvSeasonId") final Long tvSeasonId,
            HttpServletRequest request
    ){
        userService.appendFavoriteMovie(1, tvSeasonId);
    }

    @GetMapping(value = "/api/user/favorite")
    public List<TVSeasonUiDto> getAllFavoriteMovie(
            HttpServletRequest request
    ){
//        request.getAttribute("")
        return userService.getAllFavoriteMovie("cbtongtulenh4@gmail.com");
    }

    @PutMapping(value = "/api/user/payment")
    public void getPaymentSeasonMovie(
        @RequestParam(value = "tvSeasonId") final Long tvSeasonId,
        HttpServletRequest request
    ){
        userService.savePaidSeasonMovie(1, tvSeasonId);
    }


}
