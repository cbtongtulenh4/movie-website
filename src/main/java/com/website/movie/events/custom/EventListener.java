package com.website.movie.events.custom;

/**
 * Event Listener
 *
 * @param <E> Event types of interest to the current listener
 */

public interface EventListener<E extends AbstractEvent> {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 20/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    /**
     * This method handles events
     *
     * @param event Event object to respond to
     */
    void onEvent(E event);

}
