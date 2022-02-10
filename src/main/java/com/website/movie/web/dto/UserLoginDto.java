package com.website.movie.web.dto;

import com.website.movie.validation.ValidEmail;

public class UserLoginDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @ValidEmail
    private String email;
    private String password;

    public UserLoginDto(){

    }

    public UserLoginDto(String email){
        this.email = email;
    }

    public UserLoginDto(String email, String password){
        this.email = email;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

//    public static void main(String[] args) {
//        UserLoginDto s1 = new UserLoginDto("a", "b");
//        UserLoginDto s2 = new UserLoginDto(s1);
//        UserLoginDto s3 = s1;
//    }

}
