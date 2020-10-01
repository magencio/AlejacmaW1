using Toybox.System;
using Toybox.WatchUi as Ui;

class Battery extends Ui.Drawable {
	hidden var _batteryPercentageFont;
	
	function initialize() {
		Drawable.initialize({ :identifier => "Battery" });
				
		_batteryPercentageFont = Ui.loadResource(Rez.Fonts.Tech18Font);
	}
	
	function draw(dc) {	
		drawIcon(dc);
		drawBattery(dc);
	}
	
	function drawIcon(dc) {
		var x = 250, y = 80;
		
		dc.setColor(System.getSystemStats().charging ? $.batteryChargingColor : $.foregroundColor, Graphics.COLOR_TRANSPARENT);
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
		
    	dc.setColor($.backgroundColor, Graphics.COLOR_TRANSPARENT);
	    dc.drawText(x, y, _batteryPercentageFont, battery, Graphics.TEXT_JUSTIFY_CENTER);	
	}
}