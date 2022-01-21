package com.website.movie.events.custom;


/**
 * Event Object
 */
public abstract class AbstractEvent {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 20/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    // Event source
    protected Object source;

    public AbstractEvent(Object source){
        this.source = source;
    }

    public Object getSource() {
        return source;
    }

    public void setSource(Object source) {
        this.source = source;
    }
}
