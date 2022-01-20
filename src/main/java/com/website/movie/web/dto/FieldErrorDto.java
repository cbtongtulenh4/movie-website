package com.website.movie.web.dto;

import java.io.Serializable;


public class FieldErrorDto implements Serializable {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 19/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static final Long serialVersionUID = 1L;

    private String field;
    private String message;

    public FieldErrorDto(){

    }

    public FieldErrorDto(final String field,final String message){
        super();

        this.field = field;
        this.message = message;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
