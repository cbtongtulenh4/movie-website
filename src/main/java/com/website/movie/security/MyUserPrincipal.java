package com.website.movie.security;

import com.website.movie.persistence.entity.RoleEntity;
import com.website.movie.persistence.entity.UserEntity;
import com.website.movie.security.custom.GrantedAuthority;
import com.website.movie.security.custom.SimpleGrantedAuthority;
import com.website.movie.security.custom.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class MyUserPrincipal implements UserDetails {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static final long serialVersionUID = 1L;
    private UserEntity user;

    public MyUserPrincipal(final UserEntity user){
        this.user = user;
    }

    @Override
    public String getUsername() {
        return user.getUsername();
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isEnable() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthority() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (RoleEntity privilege : this.user.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(privilege.getName()));
        }
        return authorities;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "MyUserPrincipal{" +
                "user=" + user +
                '}';
    }
}
