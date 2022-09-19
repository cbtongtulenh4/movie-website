package com.website.movie.web.dto;

import com.website.movie.persistence.entity.MovieGenresEntity;
import com.website.movie.persistence.entity.RateEntity;

import java.util.Set;

public class TVSeasonAbstractDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 09/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static final int MAX_NEW_EPISODE = 3;

    public int[] setNewEpisode(int size) {
        int[] newEpisode;
        if (size > 0){
            newEpisode = new int[
                    Math.min(size, MAX_NEW_EPISODE)
            ];
            int length = newEpisode.length;
            int j = (length < MAX_NEW_EPISODE) ? 0 : (size - MAX_NEW_EPISODE);
            for (int i = 0; i < length; i++){
                newEpisode[i] =  ++j;
            }
        } else {
            newEpisode = null;
        }
        return newEpisode;
    }

    public String setDuration(Integer duration, int epSize){
        return epSize + "/" + ((duration == null || duration == 0) ? "??" : duration);
    }

    public String[] setGenres(Set<MovieGenresEntity> genres){
        String[] result;
        int genreSize = genres.size();
        if (genreSize > 0){
            result = new String[genreSize];
            int i = 0;
            for (MovieGenresEntity genre : genres ){
                result[i++] = genre.getName();
            }
        }
        else {
            result = null;
        }
        return result;
    }

    public static float calRate(Set<RateEntity> rates){
        if(rates.isEmpty()) return 10.0F;
        return (float) rates.stream().mapToInt(RateEntity::getValue).sum() / rates.size();
    }

//    public static int getYear(TVSeasonEntity tvSeason){
//        return tvSeason.getRelease().getYear();
//    }

}
