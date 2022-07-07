package com.website.movie.web.dto;

import com.website.movie.validation.ValidEmail;

public class UserLoginDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String username;
    private String password;

    public UserLoginDto(){

    }

    public UserLoginDto(String username){
        this.username = username;
    }

    public UserLoginDto(String email, String password){
        this.username = email;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
