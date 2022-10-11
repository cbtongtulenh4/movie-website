package com.website.movie.web.api;

import com.website.movie.constant.MessageConstants;
import com.website.movie.helper.converter.Convert;
import com.website.movie.persistence.entity.ProfileEntity;
import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.security.MyUserPrincipal;
import com.website.movie.service.IGoogleDriveService;
import com.website.movie.service.IOtherMovieService;
import com.website.movie.service.IUserService;
import com.website.movie.utils.SessionUtil;
import com.website.movie.utils.custom.CustomPageable;
import com.website.movie.web.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
    public MessageDto updateUser(
            @RequestBody final UserProfileDto userProfileDto,
            HttpServletRequest request
    ){
        MessageDto messageDto = new MessageDto();
        try {
            UserEntity userEntity = userService.findUserEntityById(userProfileDto.getId());
            userEntity.setUsername(userProfileDto.getUsername());
            userEntity.setProfile(
                    Convert.convertModel(userProfileDto, ProfileEntity.class)
            );
            userService.save(userEntity);
            ((MyUserPrincipal) SessionUtil.getInstance().getValue(request, "USER_MODEL")).setUser(Convert.convertModel(userEntity, UserDto.class));
        }catch (Exception e){
            messageDto.setType(MessageConstants.DANGER);
            messageDto.setContent("Change Profile Failure");
            return messageDto;
        }
        messageDto.setType(MessageConstants.SUCCESS);
        messageDto.setContent("Change Profile Successfully");
        return messageDto;
    }

    @PostMapping(value = "/api/user/avatar")
    public String updateUserAvatar(
            @RequestParam(value = "avatarNew") final MultipartFile avatarNew,
            @RequestParam(value = "avatarOld")final String avatarIdOld,
            HttpServletRequest request
    ){
        String avatarID = googleDriveService.uploadFile(avatarNew);
        googleDriveService.deleteFile(avatarIdOld);
        ProfileEntity profile = ((MyUserPrincipal)SessionUtil.getInstance().getValue(request, "USER_MODEL")).getUser().getProfile();
        userService.saveAvatarProfileCustom(profile.getId(), avatarID);
        profile.setAvatar(avatarID);
        return avatarID;
    }


    @PostMapping(value = "/api/user/favorite")
    public void addFavoriteMovie(
            @RequestParam(value = "tvSeasonId") final Long tvSeasonId,
            HttpServletRequest request
    ){
        long userId = ((MyUserPrincipal)SessionUtil.getInstance().getValue(request, "USER_MODEL")).getUser().getId();
        userService.appendFavoriteMovie(userId, tvSeasonId);
    }

    @DeleteMapping(value = "/api/user/favorite")
    public void deleteFavoriteMovie(
            @RequestParam(value = "tvSeasonId") final Long tvSeasonId,
            HttpServletRequest request
    ){
        long userId = ((MyUserPrincipal)SessionUtil.getInstance().getValue(request, "USER_MODEL")).getUser().getId();
        userService.deleteFavoriteMovie(userId, tvSeasonId);
    }

    @GetMapping(value = "/api/user/favorite")
    public MovieListPageDto<SimpleTvSeasonDto> getAllFavoriteMovie(
            @RequestParam(value = "nextPage", defaultValue = "1") final int pageNo,
            @RequestParam(value = "maxPageItem", defaultValue = "2") final int limitMovie,
            HttpServletRequest request
    ){
        String username = ((MyUserPrincipal)(SessionUtil.getInstance().getValue(request, "USER_MODEL"))).getUsername();
        List<SimpleTvSeasonDto> simpleTvSeasonDtos = userService.getAllFavoriteMovie(username);
        CustomPageable<SimpleTvSeasonDto> pageable = new CustomPageable<>(simpleTvSeasonDtos, pageNo, limitMovie);
        return pageable.toMovieListPage();
    }

    @GetMapping(value = "/api/user/movie/paid")
    public MovieListPageDto<SimpleTvSeasonDto> getAllPaidMovie(
            @RequestParam(value = "nextPage", defaultValue = "1") final int pageNo,
            @RequestParam(value = "maxPageItem", defaultValue = "2") final int limitMovie,
            HttpServletRequest request
    ){
        Long userId = ((MyUserPrincipal)(SessionUtil.getInstance().getValue(request, "USER_MODEL"))).getUser().getId();
        CustomPageable<SimpleTvSeasonDto> pageable = userService.getAllPaidSeasonMovie(userId, pageNo, limitMovie);
        return pageable.toMovieListPage();
    }

    @PutMapping(value = "/api/user/payment")
    public void getPaymentSeasonMovie(
        @RequestParam(value = "tvSeasonId") final Long tvSeasonId,
        HttpServletRequest request
    ){
        userService.savePaidSeasonMovie(1, tvSeasonId);
    }


    @PutMapping(value = "/api/user/payment-all")
    public void paymentAllSeasonMovie(
            @RequestBody final long[] tvSeasonIds
    ){
        userService.saveAllPaidSeasonMovie(19, tvSeasonIds);
    }

}
