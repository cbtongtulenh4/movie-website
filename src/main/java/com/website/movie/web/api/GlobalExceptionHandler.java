package com.website.movie.web.api;


import com.website.movie.constant.ErrorConstants;
import com.website.movie.helper.error.CommonErrorHandler;
import com.website.movie.helper.error.InvalidDataException;
import com.website.movie.web.dto.ErrorDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.util.List;

import static org.springframework.http.HttpStatus.BAD_REQUEST;

@Order(Ordered.HIGHEST_PRECEDENCE)
@ControllerAdvice
public class GlobalExceptionHandler  extends ResponseEntityExceptionHandler{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 19/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    Logger LOGGER = LoggerFactory.getLogger(getClass());

    @Autowired
    private CommonErrorHandler errorHandler;


    @ResponseStatus(BAD_REQUEST)
    @ExceptionHandler(InvalidDataException.class)
    public ResponseEntity<?> processValidationError(InvalidDataException ex) {
        List<FieldError> errors = ex.getResult().getFieldErrors();
        for (FieldError error : errors) {
            LOGGER.error("Filed Name ::: " + error.getField() + "Error Message :::" + error.getDefaultMessage());
        }
        ErrorDto errorDto = new ErrorDto(BAD_REQUEST.value(), ErrorConstants.ERR_VALIDATION);
        return errorHandler.fieldErrorResponse(errorHandler.processFieldErrors(errorDto, errors));
    }


    @ResponseStatus(BAD_REQUEST)
    @ResponseBody
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ErrorDto methodArgumentNotValidException(MethodArgumentNotValidException ex) {
        BindingResult result = ex.getBindingResult();
        List<org.springframework.validation.FieldError> fieldErrors = result.getFieldErrors();
        ErrorDto error = new ErrorDto(BAD_REQUEST.value(), "validation error");
        return errorHandler.processFieldErrors(error, fieldErrors);
    }


}

