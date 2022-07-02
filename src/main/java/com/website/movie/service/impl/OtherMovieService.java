package com.website.movie.service.impl;

import com.website.movie.helper.converter.Convert;
import com.website.movie.persistence.dao.ICommentDAO;
import com.website.movie.persistence.dao.impl.CommentImpl;
import com.website.movie.persistence.entity.*;
import com.website.movie.persistence.repository.CommentRepository;
import com.website.movie.persistence.repository.MovieGenresRepository;
import com.website.movie.persistence.repository.RateRepository;
import com.website.movie.persistence.repository.RatingRepository;
import com.website.movie.service.IOtherMovieService;
import com.website.movie.web.dto.CommentDto;
import com.website.movie.web.dto.RateDto;
import org.hibernate.Hibernate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
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
    private CommentRepository commentRepository;

    private ICommentDAO commentDAO = new CommentImpl();

    private static final Logger LOGGER = LoggerFactory.getLogger(OtherMovieService.class);

    @Override
    public MovieGenresEntity saveGenreMovie(MovieGenresEntity genreMovie) {
        return movieGenresRepository.save(genreMovie);
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
        return ratingRepository.save(rating);
    }

    @Override
    public void deleteRatings(long[] ids) {
        for (long id : ids){
            ratingRepository.deleteById(id);
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
        List<CommentEntity> comments = commentRepository.findAll();
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


}
