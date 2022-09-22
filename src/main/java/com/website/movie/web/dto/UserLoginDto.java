package com.website.movie.web.dto;

public class UserLoginDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private String username;
    private String password;
    private String remember;

    public UserLoginDto(){

    }

    public UserLoginDto(String username){
        this.username = username;
    }

    public UserLoginDto(String email, String password){
        this.username = email;
        this.password = password;
    }

    public UserLoginDto(String username, String password, String remember) {
        this.username = username;
        this.password = password;
        this.remember = remember;
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

    public String getRemember() {
        return remember;
    }

    public void setRemember(String remember) {
        this.remember = remember;
    }

    public String toJson(){
        return "{\'username\':\'" + username + "\',\'password\':\'" + password +"\'}";
}

    @Override
    public String toString() {
        return "UserLoginDto{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
