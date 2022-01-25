package com.website.movie.validation;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Target({FIELD, ANNOTATION_TYPE})
@Retention(RUNTIME)
@Documented
public @interface Size {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 21/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */
    String message() default "";

    int min() default 0;

    int max() default Integer.MAX_VALUE;

}
