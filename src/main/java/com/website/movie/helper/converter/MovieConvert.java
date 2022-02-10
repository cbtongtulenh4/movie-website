package com.website.movie.helper.converter;

import com.website.movie.persistence.entity.MovieEntity;
import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.web.dto.MovieDto;
import com.website.movie.web.dto.TVSeasonUiDto;
import com.website.movie.web.dto.SimpleTvSeasonDto;
import org.modelmapper.ModelMapper;

import java.util.Set;

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

    public static TVSeasonUiDto toDto(TVSeasonEntity entity){
        if (entity == null){
            return null;
        }
        TVSeasonUiDto dto = modelMapper.map(entity, TVSeasonUiDto.class);
        dto.initValue(
                entity.getEpisodes(),
                entity.getGenres(),
                entity.getDuration()
        );
        return dto;
    }

//    public static TVSeasonEntity toTvSeasonEntity(TVSeasonUiDto dto){
//        if (dto == null){
//            return null;
//        }
//        TVSeasonEntity entity = modelMapper.map(dto, TVSeasonEntity.class);
//
//    }

    public static SimpleTvSeasonDto toSimpleTvSeasonDto(TVSeasonEntity entity){
        if (entity == null){
            return null;
        }
        SimpleTvSeasonDto dto = modelMapper.map(entity, SimpleTvSeasonDto.class);
        dto.initValue(
                entity.getEpisodes(),
                entity.getDuration()
        );
        return dto;
    }



}
