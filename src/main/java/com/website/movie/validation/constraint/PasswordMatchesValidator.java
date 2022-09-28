package com.website.movie.validation.constraint;

import com.website.movie.validation.PasswordMatches;
import com.website.movie.web.dto.ChangePasswordDto;
import com.website.movie.web.dto.UserRegistrationDto;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PasswordMatchesValidator implements ConstraintValidator<PasswordMatches, Object> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 18/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */


    //is self-explanatory. If a validator needs some post-construct logic,
    // here is the place to do it
    @Override
    public void initialize(PasswordMatches constraintAnnotation) {

    }

    // is the place where we place the verification logic
    @Override
    public boolean isValid(Object obj, ConstraintValidatorContext constraintValidatorContext) {
        if (obj == null) return false;
        if(obj instanceof UserRegistrationDto){
            UserRegistrationDto user = (UserRegistrationDto) obj;
            return user.getPassword().equals(user.getMatchingPassword());
        }
        ChangePasswordDto changePasswordDto = (ChangePasswordDto) obj;
        return changePasswordDto.getPassNew().equals(changePasswordDto.getPassConfirm());
    }

}
