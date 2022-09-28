package com.website.movie.helper.error;

import com.website.movie.utils.TimeUtil;
import com.website.movie.web.dto.ErrorDto;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component(value = "CommonErrorHandler")
public class CommonErrorHandler {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 19/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    public ErrorDto processFieldErrors(ErrorDto errorDto, List<FieldError> errors){
        for( FieldError error : errors ){
            errorDto.add(error);
        }
        return errorDto;
    }

    public ResponseEntity<Object> fieldErrorResponse(ErrorDto error){
        Map<String, Object> map = new HashMap<>();
        map.put("isSuccess", false);
        map.put("data", null);
        map.put("status", error.getStatus());
        map.put("message", error.getMessage());
        map.put("timeStamp", TimeUtil.getSysDate());
        map.put("filedError", error.getFieldErrors());
        return new ResponseEntity<>(map,HttpStatus.BAD_REQUEST);
    }


    public  Map<String,Object> processFieldErrors(BindingResult result){
        Map<String, Object> fieldError = new HashMap<>();
        List<FieldError>errors= result.getFieldErrors();
        for (FieldError error : errors) {
            fieldError.put(error.getField(), error.getDefaultMessage());
        }return fieldError;
    }

    public ResponseEntity<Object> fieldErrorResponse(String message,Object fieldError){
        Map<String, Object> map = new HashMap<>();
        map.put("isSuccess", false);
        map.put("data", null);
        map.put("status", HttpStatus.BAD_REQUEST);
        map.put("message", message);
        map.put("timeStamp", TimeUtil.getSysDate());
        map.put("filedError", fieldError);
        return new ResponseEntity<>(map,HttpStatus.BAD_REQUEST);
    }

}
