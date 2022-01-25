package com.website.movie.security.custom;

import java.io.Serializable;

public interface UserDetails extends Serializable {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    String getEmail();

    String getPassword();

    boolean isAccountNonExpired();

    boolean isAccountNonLocked();

    boolean isEnable();

    boolean isCredentialsNonExpired();

    java.util.Collection<? extends GrantedAuthority> getAuthority();

}
