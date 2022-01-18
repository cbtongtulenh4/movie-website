package com.website.movie.utils;

import org.springframework.lang.Nullable;

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

}
