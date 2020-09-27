using Toybox.System;
using Toybox.WatchUi as Ui;

class Battery extends Ui.Drawable {
	hidden var _color, _chargingColor, _percentageColor;
	hidden var _x, _y;
	
	function initialize(params) {
		Drawable.initialize(params);
		
		_color = params.get(:color);
		_chargingColor = params.get(:chargingColor);
		_percentageColor = params.get(:percentageColor);
		_x = params.get(:x);
		_y = params.get(:y);
	}
	
	function draw(dc) {
    	var stats = System.getSystemStats();

        // Update battery
        var battery = stats.battery;
        var charging = stats.charging;

		// Draw icon
		dc.setColor(charging ? _chargingColor : _color, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[_x - 13, _y + 3],
			[_x - 12, _y + 2],
			[_x + 12, _y + 2],
			[_x + 13, _y + 3],
			[_x + 13, _y + 5],
			[_x + 16, _y + 5],
			[_x + 16, _y + 15],
			[_x + 13, _y + 15],
			[_x + 13, _y + 17],
			[_x + 12, _y + 18],
			[_x - 12, _y + 18],
			[_x - 13, _y + 17],
		]);
		
		// Draw battery percentage
		dc.setColor(_percentageColor, Graphics.COLOR_TRANSPARENT);
		var font = Ui.loadResource(Rez.Fonts.Tech18Font);
		var fontHeight = dc.getFontHeight(font);
        dc.drawText(_x, _y, font, battery.format("%d"), Graphics.TEXT_JUSTIFY_CENTER);
	}
}