package com.website.movie.validation.constraint;

import com.website.movie.utils.EmailUtil;
import com.website.movie.utils.ValidationUtil;
import com.website.movie.validation.ValidEmail;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

// This is The Custom EmailValidator

public class EmailValidator implements ConstraintValidator<ValidEmail, String> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 18/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static final String REGEX_EMAIL = EmailUtil.REGEX_EMAIL_5;

    @Override
    public void initialize(ValidEmail constraintAnnotation) {

    }

    @Override
    public boolean isValid(String email, ConstraintValidatorContext constraintValidatorContext) {
        //Way 1: use matches() method of String
        //email.matches(regex);

        //Way 2: use Pattern -> Matcher
        return ValidationUtil.validateExecute(email, REGEX_EMAIL);
    }

}
