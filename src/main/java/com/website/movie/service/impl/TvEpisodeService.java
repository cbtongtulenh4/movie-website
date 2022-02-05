package com.website.movie.service.impl;

import com.website.movie.persistence.entity.TVEpisodeEntity;
import com.website.movie.persistence.repository.TVEpisodeRepository;
import com.website.movie.service.ITvEpisodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TvEpisodeService implements ITvEpisodeService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 05/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private TVEpisodeRepository episodeRepository;


    @Override
    public TVEpisodeEntity createTvEpisode(TVEpisodeEntity episode) {
        return episodeRepository.save(episode);
    }
}
