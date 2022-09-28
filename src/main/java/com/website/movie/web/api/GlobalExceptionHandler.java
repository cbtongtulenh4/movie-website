package com.website.movie.web.api;


import com.website.movie.constant.ErrorConstants;
import com.website.movie.helper.error.CommonErrorHandler;
import com.website.movie.helper.error.InvalidDataException;
import com.website.movie.helper.error.MailAuthenticationException;
import com.website.movie.web.dto.ErrorDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.validation.ConstraintViolationException;
import java.util.List;

import static org.springframework.http.HttpStatus.BAD_REQUEST;

@Order(Ordered.HIGHEST_PRECEDENCE)
@ControllerAdvice
public class GlobalExceptionHandler{  //extends ResponseEntityExceptionHandler{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 19/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    Logger LOGGER = LoggerFactory.getLogger(getClass());

    @Autowired
    private CommonErrorHandler errorHandler;

    @Autowired
    private MessageSource messages;


    @ResponseStatus(BAD_REQUEST)
    @ExceptionHandler(InvalidDataException.class)
    public ResponseEntity<?> processValidationError(InvalidDataException ex) {
        List<FieldError> errors = ex.getResult().getFieldErrors();
        for (FieldError error : errors) {
            LOGGER.error("Filed Name ::: " + error.getField() + " - Error Message :::" + error.getDefaultMessage());
        }
        ErrorDto errorDto = new ErrorDto(BAD_REQUEST.value(), ErrorConstants.ERR_VALIDATION);
        return errorHandler.fieldErrorResponse(errorHandler.processFieldErrors(errorDto, errors));
    }


    @ResponseStatus(BAD_REQUEST)
    @ResponseBody
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ErrorDto methodArgumentNotValidException(MethodArgumentNotValidException ex) {
        List<FieldError> fieldErrors = ex.getBindingResult().getFieldErrors();
        for (FieldError error : fieldErrors) {
            LOGGER.error("Filed Name ::: " + error.getField() + " - Error Message :::" + error.getDefaultMessage());
        }
        ErrorDto error = new ErrorDto(BAD_REQUEST.value(), "validation error");
        return errorHandler.processFieldErrors(error, fieldErrors);
    }

    @ExceptionHandler({MailAuthenticationException.class})
    @ResponseBody
    public ErrorDto handleMail(MailAuthenticationException ex, WebRequest request){
        LOGGER.error(ex.getLocalizedMessage(), ex);
        return new ErrorDto(
                BAD_REQUEST.value(),
                messages.getMessage("message.email.config.error", null, "Mail Error", request.getLocale())
        );
    }

    @ExceptionHandler({NumberFormatException.class})
    @ResponseBody
    public ErrorDto handleNumberFormatException(NumberFormatException ex, WebRequest request){
        LOGGER.error(ex.getLocalizedMessage(), ex);
        return new ErrorDto(
                BAD_REQUEST.value(),
                messages.getMessage("message.error.numberFormat", null, "Number Format Error", request.getLocale())
        );
    }

    @ExceptionHandler(MultipartException.class)
    @ResponseBody
    public ErrorDto handleMultipartException(MultipartException ex, WebRequest request){
        LOGGER.error(ex.getLocalizedMessage(), ex);
        return new ErrorDto(
                BAD_REQUEST.value(),
                messages.getMessage("message.error.multipart", null, "Multiple part File error", request.getLocale())
        );
    }

    @ExceptionHandler({ ConstraintViolationException.class })
    public ResponseEntity<Object> handleConstraintViolation(
            ConstraintViolationException ex, WebRequest request) {
//        List<String> errors = new ArrayList<>();
//        for (ConstraintViolation<?> violation : ex.getConstraintViolations()) {
//            errors.add(violation.getRootBeanClass().getName() + " " +
//                    violation.getPropertyPath() + ": " + violation.getMessage());
//        }
//        return errorHandlerController(ex, HttpStatus.BAD_REQUEST);
        return null;
    }

    @ExceptionHandler({ Exception.class })
    public ResponseEntity<?> handleInternal(RuntimeException ex, WebRequest request){
        LOGGER.error("500 Status error", ex);
        ErrorDto errorDto = new ErrorDto(
                BAD_REQUEST.value(),
                messages.getMessage("message.error", null, "Internal Error", request.getLocale())
        );
        return errorHandler.fieldErrorResponse(errorDto);
    }

    @ExceptionHandler({
            NoHandlerFoundException.class,
            HttpServerErrorException.InternalServerError.class,
            NullPointerException.class,
            ClassNotFoundException.class,
            HttpClientErrorException.Unauthorized.class,
            HttpClientErrorException.BadRequest.class,
            HttpMediaTypeNotAcceptableException.class
    })
    public String errorHandle(){
        return "redirect:/error";
    }


}

