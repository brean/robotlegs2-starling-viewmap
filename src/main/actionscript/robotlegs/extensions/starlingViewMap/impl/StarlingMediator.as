package robotlegs.extensions.starlingViewMap.impl {

import flash.events.Event;
import flash.events.IEventDispatcher;

import robotlegs.bender.extensions.localEventMap.api.IEventMap;
import robotlegs.bender.extensions.mediatorMap.api.IMediator;
import robotlegs.bender.framework.api.ILogger;

/**
 * @author jamieowen
 */
public class StarlingMediator implements IMediator {
    [Inject]
    public var eventMap:IEventMap;

    [Inject]
    public var eventDispatcher:IEventDispatcher;

    [Inject]
    public var log:ILogger;

    private var _viewComponent:Object;

    public function set viewComponent(view:Object):void {
        _viewComponent = view;

        log.debug("Initializing view.");
    }


    public function get viewComponent():Object {
        return _viewComponent;
    }


    public function initialize():void {
    }


    public function destroy():void {
        log.debug("Destroying view.");

        eventMap.unmapListeners();
    }


    protected function addContextListener(eventString:String, listener:Function, eventClass:Class = null):void {
        eventMap.mapListener(eventDispatcher, eventString, listener, eventClass);
    }


    protected function removeContextListener(eventString:String, listener:Function, eventClass:Class = null):void {
        eventMap.unmapListener(eventDispatcher, eventString, listener, eventClass);
    }


    protected function dispatch(event:Event):void {
        if (eventDispatcher.hasEventListener(event.type))
            eventDispatcher.dispatchEvent(event);
    }
}
}
