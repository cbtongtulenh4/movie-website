package com.website.movie.validation.constraint;

import com.website.movie.validation.ValidVietnamese;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class VietnameseValidator implements ConstraintValidator<ValidVietnamese, String> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Override
    public void initialize(ValidVietnamese constraintAnnotation) {

    }

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        return false;
    }

}
