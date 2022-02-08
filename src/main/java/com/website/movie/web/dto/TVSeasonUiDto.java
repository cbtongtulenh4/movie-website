package com.website.movie.web.dto;

import com.website.movie.persistence.entity.TVEpisodeEntity;

import java.util.Set;

public class TVSeasonUiDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 07/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static final int MAX_NEW_EPISODE = 3;


    private Long id;

    private String title;
    private String thumbnail;
    private int[] newEpisode;
    private String duration;
    private String status;
    private String showtime;
    private String quality;
    private String directors;
    private Integer followers;
    private Integer ageLimit;
    private Float rate;
    private Long views;
    private String summary;
    private Integer seasonNumber;

    public void setNewEpisode(Set<TVEpisodeEntity> episodes) {
        int size = episodes.size();
        if (size > 0){
            this.newEpisode = new int[
                    (size < MAX_NEW_EPISODE) ? size : MAX_NEW_EPISODE
            ];
            int length = this.newEpisode.length;
            for (int i = 0, j = size - MAX_NEW_EPISODE; i < length; i++){
                this.newEpisode[i] =  j + i;
            }
        } else {
            this.newEpisode = null;
        }
    }

    public void setDuration(Integer duration){
        StringBuilder str = new StringBuilder(this.newEpisode + "/");
        str.append((duration == null) ? "??" : duration);
        this.duration = str.toString();
    }


}
