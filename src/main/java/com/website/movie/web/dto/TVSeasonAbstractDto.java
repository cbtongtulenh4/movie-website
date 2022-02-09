package com.website.movie.web.dto;

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
                    (size < MAX_NEW_EPISODE) ? size : MAX_NEW_EPISODE
                    ];
            int length = newEpisode.length;
            for (int i = 0, j = size - MAX_NEW_EPISODE; i < length; i++){
                newEpisode[i] =  ++j;
            }
        } else {
            newEpisode = null;
        }
        return newEpisode;
    }

    public String setDuration(Integer duration, int epSize){
        StringBuilder str = new StringBuilder(epSize + "/");
        str.append((duration == null) ? "??" : duration);
        return str.toString();
    }

}
