package com.website.movie.events.custom;


/**
 * Event broadcaster - Event Publisher
 * 1.Broadcast the event( broadcast the event to all listeners, and listeners interested in the event will handle the event )
 * 2.Manage event listeners( register and remove listeners, associate events with listeners )
 */
public interface EventMultiCaster {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 20/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    /**
     * execute action 1
     *
     * @param event Event Object
     */
    void MulticastEvent(AbstractEvent event);

    /**
     * Add an event listener( the listener contains events that can be handled in the listener )
     *
     * @param listener Listener to add
     */
    void addEventListener(EventListener<?> listener);

    /**
     * Remove an event listener
     *
     * @param listener Listener to removed
     */
    void removeEventListener(EventListener<?> listener);
}
