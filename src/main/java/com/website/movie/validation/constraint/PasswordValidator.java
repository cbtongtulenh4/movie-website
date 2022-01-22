package com.website.movie.validation.constraint;

import com.website.movie.utils.ValidationUtil;
import com.website.movie.validation.ValidPassword;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.Arrays;

public class PasswordValidator implements ConstraintValidator<ValidPassword, String> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static String regexPassword = null;

    @Override
    public void initialize(ValidPassword constraintAnnotation) {

    }

    @Override
    public boolean isValid(String password, ConstraintValidatorContext constraintValidatorContext) {
        return validatePassword(password);
    }

    //check Password
    private boolean validatePassword(String password){
        regexPassword = buildValidatorPassword(
                false,
                false,
                false,
                false,
                6,
                30);
        return ValidationUtil.validateExecute(password, regexPassword);
    }

    // build regex Password
    private String buildValidatorPassword(
            boolean forceChar,
            boolean forceSpecialChar,
            boolean forceCapitalLetter,
            boolean forceNumber,
            int minLength,
            int maxLength)
    {
        StringBuilder str = new StringBuilder("(");
        if(forceChar){
            str.append("(?=.*[a-z])");
        }
        if (forceSpecialChar){
            str.append("(?=.*[@#$%])");
        }
        if (forceNumber){
            str.append("(?=.*d)");
        }
        if (forceCapitalLetter){
            str.append("(?=.*[A-Z])");
        }
        //limit length of password
        str.append(".{" + minLength + "," + maxLength + "})");
        return str.toString();
    }


    /**
     *
     * different way validation password
     * use library passay - org.passay - import maven dependency
     *
     */
/*
    private boolean validationPasswordLibrary(String password, ConstraintValidatorContext context){
        PasswordValidator validator = new PasswordValidator(Arrays.asList(
                new LengthRule(8, 30),
                new UppercaseCharacterRule(1),
                new DigitCharacterRule(1),
                new SpecialCharacterRule(1),
                new NumericalSequenceRule(3,false),
                new AlphabeticalSequenceRule(3,false),
                new QwertySequenceRule(3,false),
                new WhitespaceRule()));

        RuleResult result = validator.validate(new PasswordData(password));
        if (result.isValid()) {
            return true;
        }
        context.disableDefaultConstraintViolation();
        context.buildConstraintViolationWithTemplate(
                Joiner.on(",").join(validator.getMessages(result)))
                .addConstraintViolation();
        return false;
    }
*/

}
