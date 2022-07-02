package com.website.movie.web.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CommentDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 27/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String name;
    private String pathImg;
    private String content;
    private int numLike;
    private int spam;
    private int ep;
    private String timeAgo;
    private long parentId;
    private long userId;

    private List<CommentDto> commentDtos = new ArrayList<>();

}
