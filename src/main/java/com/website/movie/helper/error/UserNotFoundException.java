package com.website.movie.helper.error;

public class UserNotFoundException extends RuntimeException{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */
    public UserNotFoundException(){
        super();
    }

    public UserNotFoundException(final String message, final Throwable cause){
        super(message, cause);
    }

    public UserNotFoundException(final String message){
        super(message);
    }

    public UserNotFoundException(final Throwable cause){
        super(cause);
    }
}
