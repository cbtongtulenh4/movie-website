package com.website.movie.service.impl;

import com.website.movie.constant.CacheConstants;
import com.website.movie.helper.converter.Convert;
import com.website.movie.helper.converter.MovieConvert;
import com.website.movie.persistence.dao.IUserDAO;
import com.website.movie.persistence.dao.impl.UserImpl;
import com.website.movie.persistence.entity.MovieEntity;
import com.website.movie.persistence.entity.MovieGenresEntity;
import com.website.movie.persistence.entity.TVSeasonEntity;
import com.website.movie.persistence.repository.MovieGenresRepository;
import com.website.movie.persistence.repository.MovieRepository;
import com.website.movie.persistence.repository.TVSeasonRepository;
import com.website.movie.service.ITvSeasonService;
import com.website.movie.web.dto.*;
import lombok.SneakyThrows;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class TvSeasonService implements ITvSeasonService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 03/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
      */

    @Autowired
    private MovieRepository movieRepository;

    @Autowired
    private TVSeasonRepository tvSeasonRepository;

    @Autowired
    private MovieGenresRepository movieGenresRepository;

    private final IUserDAO userDAO = new UserImpl();

    private static final Logger LOGGER = LoggerFactory.getLogger(TvSeasonService.class);

    @Override
    public TVSeasonEntity createSeasonMovie(TVSeasonUiDto tvSeasonDto) {
        TVSeasonEntity tvSeasonEntity = Convert.convertModel(tvSeasonDto, TVSeasonEntity.class);
        MovieEntity movieEntity = movieRepository.findById(tvSeasonDto.getMovie_id()).orElse(null);
        tvSeasonEntity.setMovie(movieEntity);
        tvSeasonEntity.setGenres(setMovieGenresEntity(tvSeasonDto.getGenres()));
        return tvSeasonRepository.save(tvSeasonEntity);
    }

    @Override
    public TVSeasonEntity createSeasonMovie(TVSeasonEntity tvSeasonEntity) {
        TVSeasonEntity temp = getSeasonMovieEntityByCode(tvSeasonEntity.getCode());
        return (temp != null) ? temp : tvSeasonRepository.save(tvSeasonEntity);
    }

    @Override
    public TVSeasonEntity getSeasonMovieById(Long id) {
        return tvSeasonRepository.findByIdAndFetchAllEagerly(id);
    }

    @Override
    public List<TVSeasonEntity> getAllSeasonMovie() {
//        return tvSeasonRepository.findAll();
        return UtilService.getSeasonMovieCache(tvSeasonRepository);
    }

    @Override
    public long countSeasonMovie() {
        return tvSeasonRepository.count();
    }

    @Override
    public List<TVSeasonEntity> getSeasonMoviesByFilter(MovieFilterDto movieFilter, Sort sort) {
        List<TVSeasonEntity> tvSeasons = tvSeasonRepository.findAll(sort);
        List<TVSeasonEntity> result = new ArrayList<>();
        tvSeasons.forEach(e -> {
            e.getSeason();
            if(seasonMovieFilter(e, movieFilter)){
                e.getLanguages().size();
                result.add(e);
            }
        });
        return result;
    }



    @Override
    public WatchTvSeasonDto getWatchTvSeasonUiByCode(String code) {
        List<TVSeasonEntity> tvSeasonList = UtilService.getSeasonMovieCache(tvSeasonRepository);
        for (TVSeasonEntity tvSeason : tvSeasonList){
            if (tvSeason.getCode().equalsIgnoreCase(code)){
                return Convert.convertModel(tvSeason, WatchTvSeasonDto.class);
            }
        }
        return null;
    }

    @Override
    public Page<TVSeasonEntity> findAll(Pageable paging) {
        Page<TVSeasonEntity> pagedResult = tvSeasonRepository.findAll(paging);
        pagedResult.forEach(e -> {
            e.getGenres().size();
            e.getRates().size();
            e.getLanguages().size();
            e.getStudios().size();
            e.getDirectors().size();
        });
        return pagedResult;
    }

    @Override
    public TVSeasonUiDto getTvSeasonUiDtoByCode(String code) {
        TVSeasonEntity tvSeason = tvSeasonRepository.findOneByCode(code);
        tvSeason.getGenres().size();
        tvSeason.getStudios().size();
        tvSeason.getLanguages().size();
        tvSeason.getCountry();
        return MovieConvert.toDto(tvSeason, tvSeason.getCost() <= 0, false);
    }

    @Override
    public TVSeasonUiDto getTvSeasonUiDtoById(long id) {
        TVSeasonEntity tvSeason = tvSeasonRepository.findById(id).orElse(null);
        if (tvSeason == null) return null;
        checkTvSeasonUiDto(tvSeason);
        return MovieConvert.toDto(tvSeason);
    }

    @Override
    public TVSeasonUiDto getTvSeasonUiDtoByCode(String code, long user_id) {
        TVSeasonEntity tvSeason = tvSeasonRepository.findOneByCode(code);
        tvSeason.getGenres().size();
        tvSeason.getStudios().size();
        tvSeason.getLanguages().size();
        tvSeason.getCountry();
        boolean isPaid = userDAO.checkPaidSeasonMovie(user_id, tvSeason.getId());
        boolean isFav = userDAO.checkFavoriteSeasonMovie(user_id, tvSeason.getId());
        return MovieConvert.toDto(tvSeason, isPaid, isFav);
    }

    @Override
    public List<TVSeasonUiDto> findLimitPopularByViews(String field, String sort, int limit) {
        return MovieConvert.toDto(tvSeasonRepository.findLimitPopularByViews(field, sort, limit));
    }

    @Override
    public List<SimpleTvSeasonDto> findLimitPopularByRate(String sort) {
        return MovieConvert.toSimpleTvSeasonDto(tvSeasonRepository.findLimitPopularByRate(sort));
    }

    @Override
    public List<TVSeasonEntity> findTVSeasonByForm(String formCode, String nameTv) {
        List<TVSeasonEntity> tvSeasons = UtilService.getMemoryCacheValue(tvSeasonRepository, CacheConstants.SEASON_MOVIES);
        try {
            String searchValue = nameTv.toLowerCase();
//            nameTv = nameTv.toLowerCase(); // why error Variable used in lambda expression should be final or effectively final
            if(formCode.equals("all")){
                return tvSeasons.parallelStream().filter(mv -> mv.getTitle().toLowerCase().contains(searchValue)).collect(Collectors.toList());
            }else {
                return tvSeasons.parallelStream().filter(mv -> mv.getForm().getCode().equals(formCode))
                        .filter(mv -> mv.getTitle().toLowerCase().contains(searchValue)).collect(Collectors.toList());
            }
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    @Override
    public String getTitleById(long id) {
        return tvSeasonRepository.getTitleById(id);
    }

    @Override
    public TVSeasonEntity getSeasonMovieEntityByCode(String code){
        return tvSeasonRepository.findOneByCode(code);
    }



    @SneakyThrows
    private boolean seasonMovieFilter(TVSeasonEntity tvSeason, MovieFilterDto movieFilter){
        // use reflection in java
        // can use java.beans package: https://stackoverflow.com/questions/3333974/how-to-loop-over-a-class-attributes-in-java
        Class<?> aClass = movieFilter.getClass();
        // get can access to private, default, protect, public field
        Field[] fieldsFilter = aClass.getDeclaredFields();
        for (Field field : fieldsFilter){
            //
            boolean isAccessible = field.isAccessible();
            if (!isAccessible) field.setAccessible(true);
            // check value filed
            if (field.get(movieFilter) != null){
                // check field need to filter
                String choice = field.getName();
                switch (choice){
                    case "title":
                        if (!titleFilter(tvSeason.getTitle(), movieFilter.getTitle()))
                            return false;
                        break;
                    case "genres":
                        if (!genresFilter(tvSeason.getGenres(), movieFilter.getGenres()))
                            return false;
                        break;
                    case "rate":
                        if(TVSeasonAbstractDto.calPercentRate(tvSeason.getRates()) > movieFilter.getRate())
                            return false;
                        break;
                    case "year":
//                        int year = TVSeasonAbstractDto.getYear(tvSeason);
                        int year = tvSeason.getSeason().getYear();
                        int[] yearFilter = movieFilter.getYear();
                        if (yearFilter[0] > year || yearFilter[1] < year)
                            return false;
                        break;
                    default:
                }
            }

            field.setAccessible(isAccessible);

        }
        return true;
    }

    private boolean genresFilter(Set<MovieGenresEntity> origin, String[] request){
        if (origin.size() < request.length) return false;
        List<String> genresTvSeason = new ArrayList<>();
        origin.forEach(e -> genresTvSeason.add(e.getName()));
        for (String genre : request){
            if (!genresTvSeason.contains(genre)){
                return false;
            }
        }
        return true;
    }

    private boolean titleFilter(String origin, String request){
        return origin.equalsIgnoreCase(request);
    }

    private Set<MovieGenresEntity> setMovieGenresEntity(String[] genresRequest){
        Set<MovieGenresEntity> result = new HashSet<>();
        for (String genreRequest : genresRequest){
            result.add(movieGenresRepository.findByName(genreRequest));
        }
        return result;
    }


    private void checkTvSeasonUiDto(TVSeasonEntity tvSeason){
        tvSeason.getGenres().size();
        tvSeason.getStudios().size();
        tvSeason.getLanguages().size();
        tvSeason.getCountry();
    }


}
