package com.website.movie.web.dto;

import com.website.movie.validation.PasswordMatches;
import com.website.movie.validation.ValidEmail;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@PasswordMatches
public class UserRegistrationDto {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private Long id;
    @ValidEmail
    private String email;
    private String username;
    private String password;
    private String matchingPassword;


}
