package com.website.movie.utils;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

public class ModelUtil {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 10/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    public static <T> T mapper(Object obj, Class<T> tClass){
        return null;
    }

    public static Object newInstance(Class<?> tClass, Object... args) throws IllegalAccessException, InvocationTargetException, InstantiationException {
        Constructor<?>[] ctors = tClass.getDeclaredConstructors();
        Constructor<?> ctor = null;
        for (Constructor<?> constructor : ctors) {
            if (constructor.getGenericParameterTypes().length == args.length) {
                ctor = constructor;
                break;
            }
        }
        assert ctor != null;
        return ctor.newInstance(args);
    }


}
