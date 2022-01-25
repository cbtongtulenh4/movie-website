package com.website.movie.security.custom;

import com.website.movie.utils.AssertUtil;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

public class RequestMatcherRegistry implements AuthorizationRegistry<RequestMatcherRegistry>{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private Authorization authorization;
    private java.util.List<Authorization> authorizationRegistry = new ArrayList<>();

    void addAuthorization(Authorization authorization){
        this.authorizationRegistry.add(authorization);
    }

    @Override
    public RequestMatcherRegistry antMatchers(String targetDomain) {
        AssertUtil.hasText(targetDomain, "Target Domain Object textual representation is required");
        this.authorization = new Authorization();
        this.authorization.patternUrl = targetDomain;
        return this;
    }

    @Override
    public RequestMatcherRegistry access(String role) {
        AssertUtil.hasText(role, "Target Domain Object textual representation is required");
        this.authorization.principal = role;
        this.authorizationRegistry.add(this.authorization);
        return this;
    }

    @Override
    public RequestMatcherRegistry and() {
        return this;
    }

    public List<Authorization> getAuthorizationRegistry() {
        return authorizationRegistry;
    }

    protected static class Authorization{
        private String patternUrl;
        private String principal;

        public Authorization(){

        }
        public Authorization(final String patternUrl, final String principal){
            this.principal = principal;
            this.patternUrl = patternUrl;
        }

        public String getPatternUrl() {
            return patternUrl;
        }

        public String getPrincipal() {
            return principal;
        }
    }

}
