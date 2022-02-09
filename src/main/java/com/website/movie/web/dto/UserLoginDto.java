package com.website.movie.web.dto;

import com.website.movie.validation.ValidEmail;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

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

    public static void main(String[] args) {
        UserLoginDto obj = new UserLoginDto("dfsjfd@gmail.com");
//        Field[] fieldsFilter = temp.getClass().getDeclaredFields();
//        for (Field field : fieldsFilter){
//            System.out.println(field.get);
//        }
        Class<?> c = obj.getClass();
        Field[] fields = c.getDeclaredFields();
        Map<String, Object> temp = new HashMap<String, Object>();

        for( Field field : fields ){
            try {
//                temp.put(field.getName().toString(), field.get(obj));
                System.out.println(field.getName());
            } catch (IllegalArgumentException e1) {
            } catch (IllegalAccessException e1) {
            }
        }
//        System.out.println(temp);
    }
}
