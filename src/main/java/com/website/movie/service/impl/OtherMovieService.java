package com.website.movie.service.impl;

import com.website.movie.cache.InMemoryCache;
import com.website.movie.constant.CacheConstants;
import com.website.movie.helper.converter.Convert;
import com.website.movie.persistence.dao.ICommentDAO;
import com.website.movie.persistence.dao.impl.CommentImpl;
import com.website.movie.persistence.entity.*;
import com.website.movie.persistence.repository.*;
import com.website.movie.service.IOtherMovieService;
import com.website.movie.web.dto.CommentDto;
import com.website.movie.web.dto.RateDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OtherMovieService implements IOtherMovieService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 09/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Autowired
    private MovieGenresRepository movieGenresRepository;
    @Autowired
    private RatingRepository ratingRepository;
    @Autowired
    private RateRepository rateRepository;
    @Autowired
    private CountryRepository countryRepository;
    @Autowired
    private LanguageRepository languageRepository;
    @Autowired
    private SeasonRepository seasonRepository;
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private StudioRepository studioRepository;
    @Autowired
    private MovieDirectorRepository directorRepository;
    @Autowired
    private MovieCastRepository castRepository;
    @Autowired
    private MovieCharacterRepository characterRepository;



    private ICommentDAO commentDAO = new CommentImpl();

    private static final Logger LOGGER = LoggerFactory.getLogger(OtherMovieService.class);

    @Override
    public MovieGenresEntity saveGenreMovie(MovieGenresEntity genreMovie) {
        if (genreMovie.getId() == null){
            List<MovieGenresEntity> genresList = UtilService.getMemoryCacheValue(movieGenresRepository, CacheConstants.MOVIE_GENRES);
            MovieGenresEntity genres = genresList.stream().filter(e -> e.getCode().equals(genreMovie.getCode())).findFirst().orElse(null);
            if (genres != null) return genres;
        }
        InMemoryCache.getInstance().remove(CacheConstants.MOVIE_GENRES);
        return movieGenresRepository.save(genreMovie);
    }

    @Override
    public List<MovieGenresEntity> saveListGenreMovie(List<MovieGenresEntity> movieGenresEntities) {
        List<MovieGenresEntity> store = getAllMovieGenres();
        movieGenresEntities.removeIf(store::contains);
        if (movieGenresEntities.isEmpty()){
            return null;
        }
        InMemoryCache.getInstance().remove(CacheConstants.MOVIE_GENRES);
        return movieGenresRepository.saveAll(movieGenresEntities);
    }

    @Override
    public void deleteGenresMovie(long[] ids) {
        for (long id : ids){
            movieGenresRepository.deleteById(id);
        }
    }

    @Override
    public MovieGenresEntity findOneGenreMovieById(long id) {
        return movieGenresRepository.findById(id).orElse(null);
    }

    @Override
    public List<MovieGenresEntity> findAllGenreMovie() {
        return movieGenresRepository.findAll();
    }

    @Override
    public RatingEntity save(RatingEntity rating) {
        if (rating.getId() == null){
            List<RatingEntity> ratings = UtilService.getMemoryCacheValue(ratingRepository, CacheConstants.MOVIE_RATINGS);
            RatingEntity temp = ratings.stream().filter(e -> e.getCode().equals(rating.getCode())).findFirst().orElse(null);
            if (temp != null) return temp;
        }
        InMemoryCache.getInstance().remove(CacheConstants.MOVIE_RATINGS);
        return ratingRepository.save(rating);
    }

    @Override
    public MovieCharacterEntity save(MovieCharacterEntity character) {
        if (character.getId() == null){
            List<MovieCharacterEntity> characters = UtilService.getMemoryCacheValue(characterRepository, CacheConstants.MOVIE_CHARACTERS);
            MovieCharacterEntity temp = characters.stream().filter(e -> e.getName().equals(character.getName())).findFirst().orElse(null);
            if (temp != null) return temp;
        }
        InMemoryCache.getInstance().remove(CacheConstants.MOVIE_CHARACTERS);
        return characterRepository.save(character);
    }

    @Override
    public MovieCastEntity save(MovieCastEntity cast) {
        if (cast.getId() == null){
            List<MovieCastEntity> castList = UtilService.getMemoryCacheValue(castRepository, CacheConstants.MOVIE_CAST);
            MovieCastEntity temp = castList.stream().filter(e -> e.getCode().equals(cast.getCode())).findFirst().orElse(null);
            if (temp != null) return temp;
        }
        InMemoryCache.getInstance().remove(CacheConstants.MOVIE_CAST);
        return castRepository.save(cast);
    }

    @Override
    public MovieDirectorEntity save(MovieDirectorEntity director) {
        if (director.getId() == null){
            List<MovieDirectorEntity> directorList = UtilService.getMemoryCacheValue(directorRepository, CacheConstants.MOVIE_DIRECTORS);
            MovieDirectorEntity temp = directorList.stream().filter(e -> e.getCode().equals(director.getCode())).findFirst().orElse(null);
            if (temp != null) return temp;
        }
        InMemoryCache.getInstance().remove(CacheConstants.MOVIE_DIRECTORS);
        return directorRepository.save(director);
    }

    @Override
    public void deleteRatings(long[] ids) {
        List<RatingEntity> ratings = UtilService.getMemoryCacheValue(ratingRepository, CacheConstants.MOVIE_RATINGS);
        RatingEntity rating;
        for (long id : ids){
            rating = ratings.stream().filter(e -> e.getId() == id).findFirst().orElse(null);
            if (rating != null){
                rating.closeTvSeasons();
                ratingRepository.deleteById(id);
            }
        }
    }

    @Override
    public RateEntity save(RateEntity rateEntity) {
        return rateRepository.save(rateEntity);
    }

    @Override
    public RateDto save(int rateVal, UserEntity user, TVSeasonEntity tvSeason) {
        RateEntity rateEntity = new RateEntity(rateVal, user, tvSeason);
        rateRepository.save(rateEntity);
        return null;
    }

    @Override
    public RateDto getRateMovieSeason(Long id) {
        List<RateEntity> rates = rateRepository.findAllByTvSeasonId(id);
        RateDto rateDto = new RateDto(10.0F, 0);
        if(rates.isEmpty()) return rateDto;
        rateDto.setValue((float) rates.stream().mapToInt(RateEntity::getValue).sum() / rates.size());
        rateDto.setNumPeople(rates.size());
        return rateDto;
    }

    @Override
    public List<RatingEntity> findAllRating() {
        return null;
    }




    @Override
    public RatingEntity findOneRatingById(long id) {
        return null;
    }

    @Override
    public CommentEntity save(CommentEntity commentEntity) {
        return commentRepository.save(commentEntity);
    }

    @Override
  //  @Transactional(propagation= Propagation.REQUIRED, readOnly=true, noRollbackFor=Exception.class) - not working
    public List<CommentEntity> getAllComment() {
//        List<CommentEntity> comments = commentRepository.findAll();
//        comments.forEach(
//                e -> LOGGER.info("children with info: ", e.getComments())
//        );
//        Hibernate.initialize();
        return commentRepository.findAll();
    }

    @Override
    public int updateLikeCommentById(boolean isLike, long commentId) {
        commentDAO.updateNumLikeById(isLike ? 1 : -1, commentId);
        return commentRepository.getLikeById(commentId);
    }

    @Override
    public void updateSpamCommentById(boolean isSpam, long commentId) {
        commentDAO.updateSpamById(isSpam ? 1 : -1, commentId);
    }

    @Override
//    @Transactional(propagation= Propagation.REQUIRED, readOnly=true, noRollbackFor=Exception.class) - not working
    public List<CommentDto> getCommentByParentIdAndTvSeasonId(Long cmParentId, Long tvSeasonId) {
        return Convert.toListCommentDto(commentRepository.findByParentIdAndTvSeasonId(cmParentId, tvSeasonId));
    }

    @Override
    public CountryEntity saveCountry(CountryEntity country) {
        if (country.getId() == null){
            List<CountryEntity> countries = UtilService.getMemoryCacheValue(countryRepository, CacheConstants.MOVIE_COUNTRIES);
            CountryEntity temp = countries.stream().filter(e -> e.getCode().equals(country.getCode())).findFirst().orElse(null);
            if (temp != null) return temp;
        }
        InMemoryCache.getInstance().remove(CacheConstants.MOVIE_COUNTRIES);
        return countryRepository.save(country);
    }

    @Override
    public LanguageEntity saveLanguage(LanguageEntity language) {
        if (language.getId() == null){
            List<LanguageEntity> languages = UtilService.getMemoryCacheValue(languageRepository, CacheConstants.MOVIE_LANGUAGES);
            LanguageEntity temp = languages.stream().filter(e -> e.getCode().equals(language.getCode())).findFirst().orElse(null);
            if (temp != null) return temp;
        }
        InMemoryCache.getInstance().remove(CacheConstants.MOVIE_LANGUAGES);
        return languageRepository.save(language);
    }

    @Override
    public StudioEntity saveStudio(StudioEntity studio) {
        if (studio.getId() == null){
            List<StudioEntity> studios = UtilService.getMemoryCacheValue(studioRepository, CacheConstants.MOVIE_STUDIOS);
            StudioEntity temp = studios.stream().filter(e -> e.getCode().equals(studio.getCode())).findFirst().orElse(null);
            if (temp != null) return temp;
        }
        InMemoryCache.getInstance().remove(CacheConstants.MOVIE_STUDIOS);
        return studioRepository.save(studio);
    }

    @Override
    public SeasonEntity saveSeason(SeasonEntity season) {
        if (season.getId() == null){
            List<SeasonEntity> seasons = UtilService.getMemoryCacheValue(seasonRepository, CacheConstants.MOVIE_SEASONS);
            SeasonEntity temp = seasons.stream().filter(e -> e.getCode().equals(season.getCode())).findFirst().orElse(null);
            if (temp != null) return temp;
        }
        InMemoryCache.getInstance().remove(CacheConstants.MOVIE_SEASONS);
        return seasonRepository.save(season);
    }

    private List<MovieGenresEntity> getAllMovieGenres(){
        List<MovieGenresEntity> movieGenres = (List<MovieGenresEntity>) InMemoryCache.getInstance().get(CacheConstants.MOVIE_GENRES);
        if (movieGenres == null){
            movieGenres = movieGenresRepository.findAll();
            InMemoryCache.getInstance().add(CacheConstants.MOVIE_GENRES, movieGenres);
        }
        return movieGenres;
    }

    private <T, D> T checkSave(T object, JpaRepository<T, D> repository, String nameCache){
//        List<T> valueCache = UtilService.getMemoryCacheValue(repository, nameCache);
//        RatingEntity rating;
//        for (long id : ids){
//            rating = valueCache.stream().filter(e -> e.getId() == id).findFirst().orElse(null);
//            if (rating != null){
//                rating.closeTvSeasons();
//                ratingRepository.deleteById(id);
//            }
//        }
        return null;
    }

}
