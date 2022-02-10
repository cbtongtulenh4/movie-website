package com.website.movie.web.api;

import com.website.movie.helper.converter.Convert;
import com.website.movie.helper.converter.MovieConvert;
import com.website.movie.helper.error.InvalidDataException;
import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.service.IMovieService;
import com.website.movie.service.ITvSeasonService;
import com.website.movie.web.dto.MovieFilterDto;
import com.website.movie.web.dto.SimpleTvSeasonDto;
import com.website.movie.web.dto.TVSeasonUiDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.*;

@RestController(value = "TvSeasonRestAPI")
public class TVSeasonRestController {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 03/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private ITvSeasonService tvSeasonService;
    @Autowired
    private IMovieService movieService;

    private static final Logger LOGGER = LoggerFactory.getLogger(TVSeasonRestController.class);

    @PostMapping(value = "/api/movie/season")
    public TVSeasonUiDto createSeasonMovie(
            @RequestBody @Valid final TVSeasonUiDto seasonDto,
            final BindingResult result)
    {
        LOGGER.info("Create a season movie with information: {}", seasonDto);
        if (result.hasErrors()){
            throw new InvalidDataException(result);
        }
        TVSeasonEntity seasonEntity = tvSeasonService.createSeasonMovie(seasonDto);
        seasonDto.setId(seasonEntity.getId());
        return seasonDto;
    }

    @GetMapping(value = "/api/movie/season/random")
    public ModelAndView getIdSeasonMovieRandom(final RedirectAttributes redirectAttributes){
        long amountSeasonMovie = tvSeasonService.countSeasonMovie();
        long id = 1 + (long) (Math.random() * (amountSeasonMovie - 1));
        redirectAttributes.addAttribute("id", id);
        return new ModelAndView("redirect:/movieSingle");
    }

    @GetMapping(value = "/api/movie/season/{id}")
    public TVSeasonUiDto getSeasonMovie(@PathVariable final long id){
        TVSeasonEntity seasonEntity = tvSeasonService.getSeasonMovieById(id);
        return MovieConvert.toDto(seasonEntity);
    }

    @PostMapping(value = "/api/movie/season/filter")
    public List<SimpleTvSeasonDto> getMoviesByFilter(
        @RequestBody final MovieFilterDto movieFilterDto
    ){
        List<TVSeasonEntity> tvSeasonEntity = tvSeasonService.getSeasonMoviesByFilter(movieFilterDto);
        List<SimpleTvSeasonDto> simpleTvSeasonDtos = new ArrayList<>();
        tvSeasonEntity.forEach(e -> simpleTvSeasonDtos.add(MovieConvert.toSimpleTvSeasonDto(e)));
        return simpleTvSeasonDtos;
    }


}
