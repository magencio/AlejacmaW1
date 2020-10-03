using Toybox.System;
using Toybox.WatchUi as Ui;

class Battery extends Ui.Drawable {

	function initialize() {
		Drawable.initialize({ :identifier => "Battery" });
	}
	
	function draw(dc) {	
		drawIcon(dc);
		drawBattery(dc);
	}
	
	function drawIcon(dc) {
		var x = 250, y = 80;
		
		dc.setColor(System.getSystemStats().charging ? $.colorBatteryCharging : $.colorBattery, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x - 13, y + 3],
			[x - 12, y + 2],
			[x + 12, y + 2],
			[x + 13, y + 3],
			[x + 13, y + 5],
			[x + 16, y + 5],
			[x + 16, y + 15],
			[x + 13, y + 15],
			[x + 13, y + 17],
			[x + 12, y + 18],
			[x - 12, y + 18],
			[x - 13, y + 17]]);		
	}
	
	function drawBattery(dc) {
		var x = 250, y = 80;
		
		var battery = System.getSystemStats().battery;
		battery = battery.format("%d");
		
    	dc.setColor($.colorBatteryPercentage, Graphics.COLOR_TRANSPARENT);
	    dc.drawText(x, y, $.fontSmall, battery, Graphics.TEXT_JUSTIFY_CENTER);	
	}
}