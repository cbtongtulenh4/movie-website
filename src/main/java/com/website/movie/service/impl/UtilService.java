package com.website.movie.service.impl;

import com.website.movie.cache.InMemoryCache;
import com.website.movie.constant.CacheConstants;
import com.website.movie.persistence.entity.TVSeasonEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UtilService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 05/03/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */




    public static List<TVSeasonEntity> getSeasonMovieCache(JpaRepository<TVSeasonEntity, Long> tvSeasonRepository){
        List<TVSeasonEntity> objects = (List<TVSeasonEntity>) InMemoryCache.getInstance().get(CacheConstants.SEASON_MOVIES);
        if (objects == null){
            objects = tvSeasonRepository.findAll();

            for (TVSeasonEntity object : objects){
                object.getRates().size();
            }

            InMemoryCache.getInstance().add(CacheConstants.SEASON_MOVIES, objects);
        }
        return objects;
    }

    public static <T, D> List<T> getMemoryCacheValue(JpaRepository<T, D> repository, String key){
        List<T> objects = (List<T>) InMemoryCache.getInstance().get(key);
        if (objects == null){
            objects = repository.findAll();
            InMemoryCache.getInstance().add(key, objects);
        }
        return objects;
    }

    public static TVSeasonEntity scrawlTvSeason(TVSeasonEntity tvSeason){
        return null;
    }


}
