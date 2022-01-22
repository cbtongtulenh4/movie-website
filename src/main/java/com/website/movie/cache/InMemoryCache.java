package com.website.movie.cache;


import java.lang.ref.SoftReference;
import java.util.concurrent.ConcurrentHashMap;

public class InMemoryCache implements Cache{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private static final int CLEAN_UP_PERIOD_IN_SEC = 10;

    /**
     * ConcurrentHashMap: is safe-thread
     * SoftReference: guarantees that referenced object will be removed in case of
     * lack of memory before OutOfMemory will be thrown
     */
    private final ConcurrentHashMap<String, SoftReference<CacheObject>> cache = new ConcurrentHashMap<>();

    @Override
    public void add(String key, Object value, long periodInMillis) {

    }

    @Override
    public void remove(String key) {

    }

    @Override
    public Object get(String key) {
        return null;
    }

    @Override
    public void clear() {

    }

    @Override
    public long size() {
        return 0;
    }

    private static class CacheObject{
        private Object value;
        private long expiryTime;
    }


}
