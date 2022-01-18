package com.website.movie.validation;

import com.website.movie.validation.constraint.PasswordMatchesValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

// NOTE: explained in ValidEmail.class

@Target({TYPE, ANNOTATION_TYPE})
// This annotation describes if the custom annotation should be available in the byte code.
// If so, Java can read it with the reflection mechanism.
@Retention(RUNTIME)
// this annotation is defined the class that is going to validate our field
@Constraint(validatedBy = PasswordMatchesValidator.class)
@Documented
public @interface PasswordMatches {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 18/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    // this is the error message that showed in UI
    String message() default "Password don't matches ";

    // this below is boilerplate code conform to Spring standard
    // LEARN MORE: https://docs.oracle.com/javaee/7/api/javax/validation/Constraint.html

    // for user to customize the targeted groups
    Class<?>[] groups() default {};

    // for extensibility purposes
    Class<? extends Payload>[] payload() default {};

}
