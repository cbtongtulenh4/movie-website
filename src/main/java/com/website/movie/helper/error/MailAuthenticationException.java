package com.website.movie.helper.error;

import org.springframework.core.NestedRuntimeException;

public class MailAuthenticationException extends NestedRuntimeException {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 20/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    public MailAuthenticationException(String msg) {
        super(msg);
    }

    public MailAuthenticationException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public MailAuthenticationException(Throwable cause){
        super("Mail Authentication Failed", cause);
    }

}
