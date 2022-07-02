package com.website.movie.cache;


import lombok.Data;

import java.lang.ref.SoftReference;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.DelayQueue;
import java.util.concurrent.Delayed;
import java.util.concurrent.TimeUnit;

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

    private static InMemoryCache inMemoryCache;
    private static ConcurrentHashMap<String, SoftReference<Object>> cache = new ConcurrentHashMap<>();
    private final DelayQueue<CacheObject> cleaningUpQueue = new DelayQueue<>();

    public InMemoryCache(){
        Thread cleanerThread = new Thread(() -> {
            while (Thread.currentThread().isAlive()) {
                try {
                    CacheObject delayCacheObject = cleaningUpQueue.take();
                    cache.remove(delayCacheObject.getKey(), delayCacheObject.reference);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                    Thread.currentThread().interrupt();
                }
            }
        });
        cleanerThread.setDaemon(true);
        cleanerThread.start();
    }

    public static InMemoryCache getInstance(){
        if (inMemoryCache == null){
            inMemoryCache = new InMemoryCache();
        }
        return inMemoryCache;
    }


    @Override
    public void add(String key, Object value, long periodInMillis) {
        if (key == null || value == null){
            // should throws error exception
            return;
        }
        if (cache.containsKey(key)){
            return;
        }
        long expiryTime = System.currentTimeMillis() + periodInMillis;
        SoftReference<Object> reference = new SoftReference<>(value);
        cache.put(key, reference);
        cleaningUpQueue.put(new CacheObject(key, reference, expiryTime));
    }

    @Override
    public void add(String key, Object value) {
        if (key == null || value == null){
            return;
        }
        if (cache.containsKey(key)){
            return;
        }
        SoftReference<Object> reference = new SoftReference<>(value);
        cache.put(key, reference);
    }

    @Override
    public void remove(String key) {
        cache.remove(key);
        // need remove object in cleaningUpQueue
    }

    @Override
    public Object get(String key) {
        return Optional.ofNullable(cache.get(key)).map(SoftReference::get).orElse(null);
    }

    @Override
    public void clear() {
        cache.clear();
    }

    @Override
    public long size() {
        return cache.size();
    }

    @Data
    private static class CacheObject implements Delayed {
        private String key;
        private SoftReference<Object> reference;
        private Long expiryTime;

        public CacheObject(final String key, final SoftReference<Object> value, final Long expiryTime){
            this.key = key;
            this.reference = value;
            this.expiryTime = expiryTime;
        }

        @Override
        public long getDelay(TimeUnit unit) {
            return unit.convert(expiryTime - System.currentTimeMillis(), TimeUnit.MILLISECONDS);
        }

        @Override
        public int compareTo(Delayed o) {
            return Long.compare(expiryTime, ((CacheObject)o).getExpiryTime());
        }
    }


}
