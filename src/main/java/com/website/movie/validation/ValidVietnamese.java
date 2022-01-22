package com.website.movie.validation;


import com.website.movie.validation.constraint.VietnameseValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Target({TYPE})
@Retention(RUNTIME)
@Constraint(validatedBy = VietnameseValidator.class)
@Documented
public @interface ValidVietnamese {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    String message() default "Invalid Vietnamese";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

}
