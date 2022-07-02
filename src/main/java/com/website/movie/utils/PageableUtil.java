package com.website.movie.utils;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.*;


public class PageableUtil {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 10/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    public static Pageable paging(Integer pageNo, Integer pageSize){
        return PageRequest.of(pageNo, pageSize);
    }

    public static Pageable paging(Integer pageNo, Integer pageSize, String sortParams){
        String[] valueSort = StringUtil.toArray(sortParams, "-");
        Sort sort = Sort.by(valueSort[0]);
        sort = (valueSort[1].equals("1")) ? sort.ascending() : sort.descending();
        return PageRequest.of(pageNo, pageSize, sort);
    }

    public static <T> List<T> paging(final int pageNo, final int pageSize, List<T> store){
        return store.subList(pageNo, pageNo + pageSize);
    }


}
