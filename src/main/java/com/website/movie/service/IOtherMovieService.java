package com.website.movie.service;

import com.website.movie.persistence.entity.*;
import com.website.movie.web.dto.CommentDto;
import com.website.movie.web.dto.RateDto;

import java.util.List;

public interface IOtherMovieService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 09/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    MovieGenresEntity saveGenreMovie(MovieGenresEntity genre);

    List<MovieGenresEntity> saveListGenreMovie(List<MovieGenresEntity> movieGenresEntities);

    void deleteGenresMovie(long[] ids);

    MovieGenresEntity findOneGenreMovieById(long id);

    List<MovieGenresEntity> findAllGenreMovie();

    RatingEntity save(RatingEntity rating);

    MovieCharacterEntity save(MovieCharacterEntity character);
    MovieCastEntity save(MovieCastEntity cast);
    MovieDirectorEntity save(MovieDirectorEntity director);

    void deleteRatings(long[] ids);

    RateEntity save(RateEntity rateEntity);

    RateDto save(final int rateVal, UserEntity user, TVSeasonEntity tvSeason);

    RateDto getRateMovieSeason(final Long id);

    List<RatingEntity> findAllRating();

    RatingEntity findOneRatingById(long id);

    CommentEntity save(CommentEntity commentEntity);

    List<CommentEntity> getAllComment();

    int updateLikeCommentById(final boolean isLike, final long commentId);

    void updateSpamCommentById(final boolean isSpam, final long commentId);

    List<CommentDto> getCommentByParentIdAndTvSeasonId(Long cmParentId, Long tvSeasonId);

    CountryEntity saveCountry(CountryEntity country);

    LanguageEntity saveLanguage(LanguageEntity language);

    StudioEntity saveStudio(StudioEntity studio);

    SeasonEntity saveSeason(SeasonEntity season);


}
