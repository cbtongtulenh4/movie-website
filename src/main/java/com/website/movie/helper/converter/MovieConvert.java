package com.website.movie.helper.converter;

import com.website.movie.persistence.entity.MovieEntity;
import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.web.dto.MovieDto;
import com.website.movie.web.dto.SimpleTvSeasonDto;
import com.website.movie.web.dto.TVSeasonUiDto;
import org.modelmapper.ModelMapper;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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
        dto.setSeasons(entity.getTvSeasons());
        dto.setCategories(entity.getCategories());
        return dto;
    }

    public static TVSeasonUiDto toDto(TVSeasonEntity entity, boolean isPaid){
        if (entity == null){
            return null;
        }
        TVSeasonUiDto dto = modelMapper.map(entity, TVSeasonUiDto.class);
        dto.setPaid(isPaid);
        dto.initValue(
                entity.getEpisodes(),
                entity.getGenres(),
                entity.getRates(),
                entity.getDuration(),
                entity.getSeason()
        );
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
                entity.getRates(),
                entity.getDuration(),
                entity.getSeason()
        );
        return dto;
    }


//    public static List<TVSeasonUiDto> toDto(List<TVSeasonEntity> entities){
//        List<TVSeasonUiDto> dtos = new ArrayList<>();
//        entities.forEach(e -> {
//            dtos.add(toDto(e));
//        });
//        return dtos;
//    }

    public static List<TVSeasonUiDto> toDto(Collection<TVSeasonEntity> entities){
        List<TVSeasonUiDto> dtos = new ArrayList<>();
        entities.forEach(e -> dtos.add(toDto(e)));
        return dtos;
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
                entity.getDuration(),
                entity.getSeason(),
                entity.getRates(),
                entity.getLanguages()
        );
        return dto;
    }

    public static List<SimpleTvSeasonDto> toSimpleTvSeasonDto(Collection<TVSeasonEntity> tvSeasons){
        if (tvSeasons.isEmpty()) return null;
        List<SimpleTvSeasonDto> rs = new ArrayList<>();
        tvSeasons.forEach(
                e -> rs.add(toSimpleTvSeasonDto(e))
        );
        return rs;
    }



}
