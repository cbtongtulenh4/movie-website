package com.website.movie.security.custom;

public interface AuthorizationRegistry<T> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    T antMatchers(String pattern);

    T access(String role);

    T and();


}
