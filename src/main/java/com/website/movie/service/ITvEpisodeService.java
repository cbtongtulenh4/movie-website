package com.website.movie.service;

import com.website.movie.persistence.entity.TVEpisodeEntity;

public interface ITvEpisodeService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 05/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    TVEpisodeEntity createTvEpisode(TVEpisodeEntity episode);

    void savePathById(final long id, final String path);

    void saveTvEpisode(TVEpisodeEntity episode);


}
