package com.website.movie.utils;

import java.util.Random;

public class ArrayUtil {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    public static String[] array(String... args){
        return args;
    }

    public static <T> T  randValue(T[] arr, int from, int end){
        Random rand = new Random();
        return arr[rand.nextInt(end) + from];
    }
    public static <T> T  randValue(T[] arr){
        Random rand = new Random();
        return arr[rand.nextInt(arr.length)];
    }

}
