package com.website.movie.web.api;

import com.website.movie.helper.converter.MovieConvert;
import com.website.movie.helper.error.InvalidDataException;
import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.service.IMovieService;
import com.website.movie.service.ITvSeasonService;
import com.website.movie.utils.PageableUtil;
import com.website.movie.utils.custom.CustomPageable;
import com.website.movie.web.dto.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

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
    public String getIdSeasonMovieRandom(){
        long amountSeasonMovie = tvSeasonService.countSeasonMovie();
        long id = 1 + (long) (Math.random() * (amountSeasonMovie - 1));
        return tvSeasonService.getTitleById(id);
    }

    @GetMapping(value = "/api/movie/season/{id}")
    public TVSeasonUiDto getSeasonMovie(@PathVariable final long id){
        TVSeasonEntity seasonEntity = tvSeasonService.getSeasonMovieById(id);
        return MovieConvert.toDto(seasonEntity);
    }

//    @GetMapping(value = "/api/movie/season/filter")
//    public List<SimpleTvSeasonDto> getMoviesByFilter(
//        @RequestBody final MovieFilterDto movieFilterDto
//    ){
//        List<TVSeasonEntity> tvSeasonEntity = tvSeasonService.getSeasonMoviesByFilter(movieFilterDto);
//        List<SimpleTvSeasonDto> simpleTvSeasonDtos = new ArrayList<>();
//        tvSeasonEntity.forEach(e -> simpleTvSeasonDtos.add(MovieConvert.toSimpleTvSeasonDto(e)));
//        return simpleTvSeasonDtos;
//    }


    @GetMapping(value = "/api/movie/season/filter")
    public MovieListPageDto getMoviesByFilter(
//            @RequestBody final MovieFilterDto movieFilterDto,
            @RequestParam(value = "sort", defaultValue = "views-des") final String sortParam,
            @RequestParam(value = "nextPage", defaultValue = "1") final int pageNo,
            @RequestParam(value = "maxPageItem", defaultValue = "2") final int limitMovie,
            HttpServletRequest request
    ){

        MovieFilterDto movieFilterDto = new MovieFilterDto();
        movieFilterDto.init(request, "title", "rating", "genres", "yearFrom", "yearTo");
        List<TVSeasonEntity> tvSeasonEntity = tvSeasonService.getSeasonMoviesByFilter(movieFilterDto, sortBy(sortParam));
        List<SimpleTvSeasonDto> simpleTvSeasonDtos = new ArrayList<>();
        tvSeasonEntity.forEach(e -> simpleTvSeasonDtos.add(MovieConvert.toSimpleTvSeasonDto(e)));

        CustomPageable<SimpleTvSeasonDto> pageable = new CustomPageable<>(simpleTvSeasonDtos, pageNo, limitMovie);

        PaginationDto pagination = new PaginationDto(limitMovie, pageNo, pageable.getTotalPages(), pageable.getTotalElements());

        return new MovieListPageDto(
                pageable.paging(),
                pagination
        );
    }

    @GetMapping(value = "/api/movie/season")
    public List<TVSeasonUiDto> getSeasonsMovie(
        @RequestParam(value = "nextPage", defaultValue = "1") final int pageNo,
        @RequestParam(value = "maxPageItem", defaultValue = "2") final int limitMovie
    ){
        Page<TVSeasonEntity> pagination = tvSeasonService.findAll(PageableUtil.paging(pageNo - 1, limitMovie));
        return MovieConvert.toDto(pagination.getContent());
    }

    @GetMapping(value = "/api/movie/tv-season/populars")
    public List<TVSeasonUiDto> getPopularSeasonsMovie(){
        return tvSeasonService.findLimitPopularByViews("views", "ASddC", 5);
    }


    private List<SimpleTvSeasonDto> sortBy(List<SimpleTvSeasonDto> store, String sortParam){
        String[] valueSort = sortParam.split("-");



        return null;
    }


    private Sort sortBy(String sortParam){
        String[] params = sortParam.split("-");
        Sort.Direction direction = params[1].equals("asc") ? Sort.Direction.ASC : Sort.Direction.DESC;
        return Sort.by(direction, params[0]);
    }


}
