package com.website.movie.security.custom;

import com.website.movie.persistence.entity.RoleEntity;
import com.website.movie.security.MyUserPrincipal;

import java.util.*;

public class ExpressionUrlAuthorization {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 23/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    public static boolean hasPermission(final RequestMatcherRegistry auth, final MyUserPrincipal targetDomain, final Object permission){
        if((auth == null) || (targetDomain == null) || !(permission instanceof String)){
            return false;
        }
        return hasPrivilege(auth.getAuthorizationRegistry(), targetDomain.getAuthority(), permission.toString().toLowerCase());
    }

    public static boolean hasPermission(final RequestMatcherRegistry auth, final Object permission){
        if((auth == null) || !(permission instanceof String)){
            return false;
        }
        return hasPrivilege(auth.getAuthorizationRegistry(), null, permission.toString().toLowerCase());
    }

    private static boolean hasPrivilege(
            final List<RequestMatcherRegistry.Authorization> auth,
            final Collection<? extends GrantedAuthority> authorities,
            final String permission)
    {
//        auth.forEach(authorization -> {
//            if(authorization.getPatternUrl().contains(permission)){
//                for (RoleEntity role : roles){
//                    if (role.getName().equals(authorization.getPrincipal()))
//                        return;
//                }
//
//            }
//        });
        for (RequestMatcherRegistry.Authorization authorization : auth){
            if(authorization.getPatternUrl().contains(permission)){
                if (authorities != null){
                    for (GrantedAuthority role : authorities){
                        if (role.getAuthority().equals(authorization.getPrincipal()))
                            return true;
                    }
                }
                return false;
            }
        }
        return true;
    }

}
