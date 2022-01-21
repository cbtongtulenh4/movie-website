package com.website.movie.events.custom;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class SimpleEventMultiCaster implements EventMultiCaster{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 20/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */


    /**
     * Handle event object and event listeners
     * ConcurrentHashMap: it allows concurrent modification of the Map from several threads without the need to block them
     */
    private Map<Class<?>, List<EventListener>> eventHandleMap = new ConcurrentHashMap<>();

    @Override
    public void MulticastEvent(AbstractEvent event) {
        List<EventListener> listeners = this.eventHandleMap.get(event.getClass());
        if (listeners != null){
            for (EventListener listener : listeners){
                listener.onEvent(event);
            }
        }
    }

    @Override
    public void addEventListener(EventListener<?> listener) {
        Class<?> eventType = getEventType(listener);
        List<EventListener> listeners = eventHandleMap.get(eventType);
        if (listeners == null){
            listeners = new ArrayList<>();
            this.eventHandleMap.put(eventType, listeners);
        }
        listeners.add(listener);
    }

    @Override
    public void removeEventListener(EventListener<?> listener) {
        Class<?> eventType = getEventType(listener);
        List<EventListener> listeners = eventHandleMap.get(eventType);
        if (listeners != null){
            listeners.remove(listener);
        }
    }


    /**
     * Get the event types that the event listener needs to listen to
     * ParameterizedType: A parameterized type is an instantiation of a generic type with actual type arguments.
     *
     * @param listener
     * @return
     */
    protected Class<?> getEventType(EventListener listener){
        ParameterizedType parameterizedType = (ParameterizedType) listener.getClass().getGenericInterfaces()[0];
        Type eventType = parameterizedType.getActualTypeArguments()[0];
        return (Class<?>) eventType;
    }

}
