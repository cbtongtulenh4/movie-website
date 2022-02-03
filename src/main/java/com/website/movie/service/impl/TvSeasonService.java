package com.website.movie.service.impl;

import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.persistence.repository.TVSeasonRepository;
import com.website.movie.service.ITvSeasonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TvSeasonService implements ITvSeasonService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 03/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
      */

    @Autowired
    private TVSeasonRepository tvSeasonRepository;

    @Override
    public TVSeasonEntity createSeasonMovie(TVSeasonEntity tvSeason) {
        return tvSeasonRepository.save(tvSeason);
    }

}
