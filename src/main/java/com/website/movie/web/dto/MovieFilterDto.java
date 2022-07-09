package com.website.movie.web.dto;

import com.website.movie.utils.StringUtil;
import lombok.Data;

import javax.servlet.http.HttpServletRequest;

@Data
public class MovieFilterDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 09/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String title;
    private Float rate;
    private String[] genres;
    private int[] year;

    public MovieFilterDto(){

    }

    public MovieFilterDto(String title, String rate, String[] genres){
        this.title = title;
        this.rate = Float.valueOf(rate);
        this.genres = genres;
    }

    public void init(HttpServletRequest request, String title, String rate, String genres, String yF, String yT){
        this.title = request.getParameter(title).isEmpty() ? null : request.getParameter(title);
        this.rate = request.getParameter(rate).isEmpty() ? null : Float.valueOf(request.getParameter(rate));
        this.genres = StringUtil.toArray(request.getParameter(genres), ",");
        if (request.getParameter(yF) == null || request.getParameter(yT) == null){
            this.year = new int[]{Integer.parseInt(request.getParameter(yF)), Integer.parseInt(request.getParameter(yT))};
        }
    }

}
