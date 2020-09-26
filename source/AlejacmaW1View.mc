using Toybox.System;
using Toybox.WatchUi;

class AlejacmaW1View extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {	
    }

    // Update the view
    function onUpdate(dc) {
    	if(dc has :setAntiAlias) {
			dc.setAntiAlias(true);
		}
    
    	/*
    	var stats = System.getSystemStats();

        // Update battery
        var battery = stats.battery;
        var charging = stats.charging;
        var batteryView = View.findDrawableById("BatteryLabel");
        if (charging) {
        	batteryView.setColor(Graphics.COLOR_GREEN);
        } 
        batteryView.setText(Lang.format("$1$%", [battery.format("%d")]));
        
   		*/
        
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
