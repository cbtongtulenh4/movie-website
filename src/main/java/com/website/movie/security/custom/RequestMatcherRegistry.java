package com.website.movie.security.custom;

import com.website.movie.utils.AssertUtil;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
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
    public RequestMatcherRegistry access(String ... roles) {
      //  AssertUtil.hasText(role, "Target Domain Object textual representation is required");
        this.authorization.principals = new ArrayList<>(
                Arrays.asList(roles)
        );
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
//        private String principal;
        private List<String> principals;

        public Authorization(){

        }
        public Authorization(final String patternUrl, String[] principal){
//            this.principal = principal;
            this.principals = new ArrayList<>(
                    Arrays.asList(principal)
            );
            this.patternUrl = patternUrl;
        }

        public void setPatternUrl(String patternUrl) {
            this.patternUrl = patternUrl;
        }

        public void setPrincipals(List<String> principals) {
            this.principals = principals;
        }

        private List<String> toPrincipals(String principal){
            return new ArrayList<>(
                    Arrays.asList(principal.replaceAll("\\s+","").split(","))
            );
        }

        public String getPatternUrl() {
            return patternUrl;
        }

        public List<String> getPrincipal() {
            return principals;
        }
    }

}
