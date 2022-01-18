package com.website.movie.validation.constraint;

import com.website.movie.utils.EmailUtil;
import com.website.movie.validation.ValidEmail;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

// This is The Custom EmailValidator

public class EmailValidator implements ConstraintValidator<ValidEmail, String> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 18/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private Pattern pattern;
    private Matcher matcher;

    @Override
    public void initialize(ValidEmail constraintAnnotation) {

    }

    @Override
    public boolean isValid(String email, ConstraintValidatorContext constraintValidatorContext) {
        return validateEmail(email);
    }

    private boolean validateEmail(final String email){
        pattern = Pattern.compile(EmailUtil.REGEX_EMAIL_5);
        matcher = pattern.matcher(email);
        return matcher.matches();
    }

}
