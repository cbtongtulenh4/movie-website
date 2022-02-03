package com.website.movie.helper.converter;

import org.modelmapper.ModelMapper;

public class Convert {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 02/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static final ModelMapper MODEL_MAPPER = new ModelMapper();

    public static <T, E> E convertModel(T obj, Class<E> zClass){
        if (obj == null){
            return null;
        }
        return MODEL_MAPPER.map(obj, zClass);
    }

}
