package com.website.movie.helper.converter;

import com.website.movie.persistence.entity.CommentEntity;
import com.website.movie.utils.TimeUtil;
import com.website.movie.web.dto.CommentDto;
import org.modelmapper.ModelMapper;
import org.modelmapper.Module;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.data.jpa.convert.threeten.Jsr310JpaConverters;

import java.util.ArrayList;
import java.util.List;

public class Convert {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 02/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static ModelMapper MODEL_MAPPER = new ModelMapper();

    public static <T, E> E convertModel(T obj, Class<E> zClass){
        if (obj == null){
            return null;
        }
        MODEL_MAPPER.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
        MODEL_MAPPER.registerModule((Module) new Jsr310JpaConverters.LocalDateTimeConverter());
        return MODEL_MAPPER.map(obj, zClass);
    }


    // commentEntity != null;
    public static CommentDto toCommentDto(CommentEntity commentEntity, long parentId){
        CommentDto comment = convertModel(commentEntity, CommentDto.class);
        comment.setTimeAgo(TimeUtil.getTimeAgoCustom(commentEntity.getCreatedOn()));
        comment.setParentId(parentId);
        for (CommentEntity c : commentEntity.getComments()) {
            comment.getCommentDtos().add(toCommentDto(c, c.getId()));
        }
        return comment;
    }

    public static List<CommentDto> toListCommentDto(List<CommentEntity> commentEntities){
        if (commentEntities.isEmpty()) return null;
        List<CommentDto> commentDtos = new ArrayList<>();
        for (CommentEntity c : commentEntities) {
            commentDtos.add(toCommentDto(c, c.getId()));
        }
        return commentDtos;
    }

}
