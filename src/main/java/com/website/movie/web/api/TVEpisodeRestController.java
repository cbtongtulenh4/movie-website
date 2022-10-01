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
import org.springframework.web.bind.annotation.*;

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
    private ITvSeasonService tvSeasonService;

    @PostMapping(value = "/api/movie/season/episode")
    public TVSeasonDto createEpisodeSeasonMovie(
        @RequestBody @Valid final TVEpisodeDto episodeDto,
        final BindingResult result
    ){
        LOGGER.info("Create a episode season movie with information: {}", episodeDto);
        if (result.hasErrors()){
            throw new InvalidDataException(result);
        }
        TVSeasonEntity seasonMovie = tvSeasonService.getSeasonMovieById(episodeDto.getSeason_id());
        if (seasonMovie == null){

        }
        TVEpisodeEntity episodeEntity = Convert.convertModel(episodeDto, TVEpisodeEntity.class);
        episodeEntity.setTvSeason(seasonMovie);
        episodeEntity = episodeService.createTvEpisode(episodeEntity);
        return Convert.convertModel(episodeEntity, TVSeasonDto.class);
    }

    @PutMapping(value = "/api/movie/season/episode/path")
    public void savePathTvEpisodeSeasonMovieById(
        @RequestParam(value = "id") final Long epID,
        @RequestParam(value = "path") final String epPath
    ){
        episodeService.savePathById(epID, epPath);
    }

    @PutMapping(value = "/api/movie/season/episode")
    public void savePathTvEpisodeSeasonMovieById(
        @RequestBody @Valid final TVEpisodeDto episodeDto
    ){
//        episodeService.saveTvEpisode(episodeDto);
    }

    @PostMapping(value = "/api/movie/tv-season/episode/path")
    public void savePathTvEpisode(
            @RequestParam final String tvSeasonCode,
            @RequestParam final int numEp,
            @RequestParam(value = "path") final String newPath
    ){
        tvSeasonService.savePathEpisode(tvSeasonCode, numEp, newPath);
    }

}
