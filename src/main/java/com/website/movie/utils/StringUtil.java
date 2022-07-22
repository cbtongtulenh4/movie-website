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

    public static String getValueByURL(String url, int index){
//        AssertUtil.notNull(url, "String input have to not null");
        String[] values = url.split("/");
        int i = (index < 0) ? values.length - 1 : index;
        return values[i];
    }

    public static String getSplitValue(String str, String regex, int index){
        String[] values = str.split(regex);
        return values[index];
    }


    public static String convertToCode(String value){
        AssertUtil.notNull(value, "Value can not null");
        return value.trim().replace(" ", "-").toLowerCase();
    }

}
