package com.website.movie.web.dto;

import lombok.Data;

@Data
public class MessageDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 21/06/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String type;
    private String content;
    private String target;

    public MessageDto(){

    }
    public MessageDto(final String type, final String content){
        this.type = type;
        this.content = content;
    }

    public MessageDto(String type, String content, String target) {
        this.type = type;
        this.content = content;
        this.target = target;
    }

    public String toStringJson(){
        return "{\"type\" : \""+ type +"\", \"content\" : \""+ content +"\", \"target\" : \""+ target +"\"}";
    }
}
