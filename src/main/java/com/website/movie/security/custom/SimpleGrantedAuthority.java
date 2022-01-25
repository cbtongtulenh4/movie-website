package com.website.movie.security.custom;

import com.website.movie.utils.AssertUtil;

public class SimpleGrantedAuthority implements GrantedAuthority{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static final long serialVersionUID = 560L;
    private final String role;

    public SimpleGrantedAuthority(final String role){
        AssertUtil.hasText(role, "A granted authority textual representation is required");
        this.role = role;
    }

    @Override
    public String getAuthority() {
        return this.role;
    }

    public int hashcode(){
        return this.role.hashCode();
    }

    public String toString(){
        return this.role;
    }

    public boolean equals(Object obj){
        if(obj == this){
            return true;
        }
        if (obj == null){
            return false;
        }
        if (obj.getClass() != getClass()){
            return false;
        }
        return obj instanceof SimpleGrantedAuthority
                ? this.role.equals(((SimpleGrantedAuthority) obj).role) : false;
    }

}
