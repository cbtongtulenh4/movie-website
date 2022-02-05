package com.website.movie.web.api;

import com.website.movie.helper.converter.Convert;
import com.website.movie.helper.error.InvalidDataException;
import com.website.movie.persistence.entity.TVEpisodeEntity;
import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.service.ITvEpisodeService;
import com.website.movie.service.ITvSeasonService;
import com.website.movie.web.dto.TVEpisodeDto;
import com.website.movie.web.dto.TVSeasonDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController(value = "TvEpisodeRestAPI")
public class TVEpisodeRestController {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 05/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static final Logger LOGGER = LoggerFactory.getLogger(TVEpisodeRestController.class);

    @Autowired
    private ITvEpisodeService episodeService;
    @Autowired
    private ITvSeasonService seasonDto;

    @PostMapping(value = "/api/movie/season")
    public TVSeasonDto createEpisodeSeasonMovie(
            @RequestBody @Valid final TVEpisodeDto episodeDto,
            final BindingResult result)
    {
        LOGGER.info("Create a episode season movie with information: {}", episodeDto);
        if (result.hasErrors()){
            throw new InvalidDataException(result);
        }
        TVSeasonEntity seasonMovie = seasonDto.getSeasonMovieById(episodeDto.getSeason_id());
        if (seasonMovie == null){

        }
        TVEpisodeEntity episodeEntity = Convert.convertModel(episodeDto, TVEpisodeEntity.class);
        episodeEntity.setTvSeason(seasonMovie);
        episodeEntity = episodeService.createTvEpisode(episodeEntity);
        return Convert.convertModel(episodeEntity, TVSeasonDto.class);
    }

}
