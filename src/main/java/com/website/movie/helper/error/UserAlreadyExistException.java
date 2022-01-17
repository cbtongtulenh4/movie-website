package com.website.movie.helper.error;

public class UserAlreadyExistException extends RuntimeException {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    public UserAlreadyExistException(){
        super();
    }

    public UserAlreadyExistException(final String message, final Throwable cause){
        super(message, cause);
    }

    public UserAlreadyExistException(final String message){
        super(message);
    }

    public UserAlreadyExistException(final Throwable cause){
        super(cause);
    }



}
