using Toybox.ActivityMonitor;
using Toybox.Application;
using Toybox.Graphics;
using Toybox.Lang;
using Toybox.System;
using Toybox.WatchUi;

class AlejacmaW1View extends WatchUi.WatchFace {
	hidden var settings;

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
    	settings = System.getDeviceSettings();
    }

    // Update the view
    function onUpdate(dc) {
    	var stats = System.getSystemStats();
    	var activity = ActivityMonitor.getInfo();
    	    
        // Get the current time and format it correctly
        var timeFormat = "$1$:$2$";
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else {
            if (Application.getApp().getProperty("UseMilitaryFormat")) {
                timeFormat = "$1$$2$";
                hours = hours.format("%02d");
            }
        }
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);
        
        // Update time
        var timeView = View.findDrawableById("TimeLabel");
        timeView.setColor(Application.getApp().getProperty("ForegroundColor"));
        timeView.setText(timeString);
        
        // Update battery
        var battery = stats.battery;
        var charging = stats.charging;
        var batteryView = View.findDrawableById("BatteryLabel");
        if (charging) {
        	batteryView.setColor(Graphics.COLOR_GREEN);
        } 
        batteryView.setText(Lang.format("$1$%", [battery.format("%d")]));
        
        // Update calories
		var calories = activity.calories;
        var caloriesView = View.findDrawableById("CaloriesLabel");
		caloriesView.setText(Lang.format("$1$kC", [ calories.format("%d")]));
		
		// Update step count
		var steps = activity.steps;
        var stepsView = View.findDrawableById("StepsLabel");
		stepsView.setText(steps.format("%d"));
        
        // Update distance
        var distance = activity.distance;
        var distanceUnits = settings.distanceUnits;
        var distanceView = View.findDrawableById("DistanceLabel");
        
        if (distanceUnits==System.UNIT_METRIC) {
			if (distance / 100000.0 >= 1){
				distance = Lang.format("$1$km", [(distance/ 100000.0).format("%.2f")]);
			} else {
				distance = Lang.format("$1$m", [(distance / 100).format("%d")]);
			}
		} else {
			if (distance / 160934 >= 1) {
				distance = Lang.format("$1$M", [(distance / 160934.0).format("%.2f")]);
			} else {
				distance = Lang.format("$1$ft", [(distance / 30.42).format("%d")]);
			}
		}
        
		distanceView.setText(distance);
        
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
