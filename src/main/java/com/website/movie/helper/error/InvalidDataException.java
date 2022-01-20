package com.website.movie.helper.error;

import org.springframework.validation.BindingResult;

public class InvalidDataException extends RuntimeException {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 19/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */
    private static final long serialVersionUID = -4164793146536667139L;

    private BindingResult result;

    public InvalidDataException(BindingResult result) {
        super();
        this.setResult(result);
    }

    public BindingResult getResult() {
        return result;
    }

    public void setResult(BindingResult result) {
        this.result = result;
    }

}

