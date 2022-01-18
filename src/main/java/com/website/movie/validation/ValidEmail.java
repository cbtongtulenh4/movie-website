package com.website.movie.validation;

// This is The Custom Annotation for Email Validation


import com.website.movie.validation.constraint.EmailValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

// LEARN ANNOTATION: w3schools.blog/custom-annotation-java

// indicate (target | location) use of annotation
@Target({TYPE, FIELD, ANNOTATION_TYPE})
// indicate this annotation (run | retention) at runtime
// This annotation describes if the cust    om annotation should be available in the byte code.
// If so, Java can read it with the reflection mechanism.
@Retention(RUNTIME)
// indicate this annotation (constraint) only use validate by EmailValidator
// this annotation is defined the class that is going to validate our field
@Constraint(validatedBy = EmailValidator.class)
@Documented
public @interface ValidEmail {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 18/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    String message() default "Invalid Email";


    // this below is boilerplate code conform to Spring standard
    // LEARN MORE: https://docs.oracle.com/javaee/7/api/javax/validation/Constraint.html

    // for user to customize the targeted groups
    Class<?>[] groups() default {};

    // for extensibility purposes
    Class<? extends Payload>[] payload() default {};

}
