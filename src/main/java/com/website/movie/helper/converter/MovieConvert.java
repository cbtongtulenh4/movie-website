package com.website.movie.helper.converter;

import com.website.movie.persistence.entity.MovieEntity;
import com.website.movie.web.dto.MovieDto;
import org.modelmapper.ModelMapper;

public class MovieConvert {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 02/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static final ModelMapper modelMapper = new ModelMapper();

    public static MovieEntity toEntity(MovieDto dto){
        if (dto == null){
            return null;
        }
        MovieEntity entity = modelMapper.map(dto, MovieEntity.class);
        if (dto.getId() != null){

        }
        return entity;
    }

    public static MovieDto toDto(MovieEntity entity){
        if (entity == null){
            return null;
        }
        MovieDto dto = modelMapper.map(entity, MovieDto.class);
        dto.setSeasons(entity.getSeasons());
        dto.setCategories(entity.getCategories());
        return dto;
    }

}
