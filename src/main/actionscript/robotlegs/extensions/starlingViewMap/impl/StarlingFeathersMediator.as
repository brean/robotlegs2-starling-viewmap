/**
 * Created by sorenjepsen on 02/02/14.
 */
package robotlegs.extensions.starlingViewMap.impl {

import starling.events.Event;
import starling.events.EventDispatcher;

public class StarlingFeathersMediator extends StarlingMediator {

    override public function set viewComponent(view:Object):void {
        super.viewComponent = view;

        EventDispatcher(viewComponent).addEventListener("creationComplete", creationCompleteHandler);
    }

    private function creationCompleteHandler(event:Event):void {
        EventDispatcher(viewComponent).removeEventListener("creationComplete", creationCompleteHandler);

        log.debug("Initialized view.");

        initializeComplete();
    }

    public function initializeComplete():void {

    }
}
}
