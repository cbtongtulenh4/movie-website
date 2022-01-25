package com.website.movie.utils;

import org.springframework.lang.Nullable;
import org.springframework.util.StringUtils;

public abstract class AssertUtil {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 18/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    // how to implementation custom @Nullable annotation
    public static void notNull(@Nullable final Object obj, final String message){
        if(obj == null){
            throw new IllegalArgumentException(message);
        }
    }

    public static void hasText(@Nullable final String text, final String message){
        if (!StringUtils.hasText(text)){
            throw new IllegalArgumentException(message);
        }
    }

//    public static Object assertThrows(final Class<?> aClass, ){
//        try {
//
//        }catch ()
//    }

}
