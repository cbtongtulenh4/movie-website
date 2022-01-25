package com.website.movie.utils;

import java.util.ResourceBundle;

public class MessageUtil {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static ResourceBundle resourceBundle = ResourceBundle.getBundle("message_en");

    public static String getMessage(final String key){
        return resourceBundle.getString(key);
    }

}
