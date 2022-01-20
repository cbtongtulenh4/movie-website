package com.website.movie.web.dto;

import org.springframework.http.HttpStatus;
import org.springframework.validation.FieldError;

import java.util.*;
import java.io.Serializable;

public class ErrorDto implements Serializable {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 19/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static Long SerialVersionUID = 1L;

    private int status;
    private String message;
    private List<FieldErrorDto> fieldErrors = new ArrayList<>();

    public ErrorDto(){
        super();

//        this.status = HttpStatus.BAD_REQUEST.value();
    }

    public ErrorDto(final String message){
        this(HttpStatus.BAD_REQUEST.value(), message);
    }

    public ErrorDto(final int status, final String message){
        super();

        this.status = status;
        this.message = message;
    }

    public ErrorDto(final int status,final String message, final List<FieldErrorDto> fieldErrors){
        super();

        this.status = status;
        this.message = message;
        this.fieldErrors = fieldErrors;
    }

    public void add(FieldError fieldError){
        fieldErrors.add(new FieldErrorDto(
                fieldError.getField(),
                fieldError.getCode())
        );
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<FieldErrorDto> getFieldErrors() {
        return fieldErrors;
    }

    public void setFieldErrors(List<FieldErrorDto> fieldErrors) {
        this.fieldErrors = fieldErrors;
    }
}
