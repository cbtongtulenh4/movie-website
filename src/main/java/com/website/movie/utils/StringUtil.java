package com.website.movie.utils;

public class StringUtil {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 18/05/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    public static String[] toArray(String str, String regex){
        if (str == null || str.isEmpty()){
            return null;
        }
        return str.split(regex);
    }

}
