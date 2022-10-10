package com.website.movie.utils.custom;

import java.util.*;

public class CustomPageable<T> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 13/02/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private List<T> store;
    private int pageNo;
    private int pageSize;

    public CustomPageable(List<T> store, int pageNo, int pageSize) {
        this.store = (store == null) ? new ArrayList<>() : store;
        this.pageNo = pageNo;
        this.pageSize = pageSize;
    }

    public List<T> paging(){
        int size = store.size();
        int from = (pageNo - 1) * pageSize;
        int end = from + pageSize;
        try{
            return store.subList(from, Math.min(end, size));
        }catch (IndexOutOfBoundsException e){
            return new ArrayList<>();
        }
    }

    public int getTotalPages(){
        int maxItem = store.size();
        int maxPage = maxItem / pageSize;
        return (maxItem%pageSize != 0) ? (maxPage + 1) : maxPage;
    }

    public long getTotalElements(){
        return store.size();
    }
}
