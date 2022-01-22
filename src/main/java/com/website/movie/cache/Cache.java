package com.website.movie.cache;

/**
 * store frequently used data into memory
 */
public interface Cache {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 22/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    /**
     * allows putting object by key for some amount of time
     * @param key
     * @param value
     * @param periodInMillis expire time
     */
    void add(final String key, final Object value, final long periodInMillis);

    /**
     * allows remove object from memory
     * @param key
     */
    void remove(final String key);

    /**
     * get value by key input
     * @param key
     * @return
     */
    Object get(final String key);

    /**
     * clear cache
     */
    void clear();

    /**
     * size of cache
     * @return
     */
    long size();

}
