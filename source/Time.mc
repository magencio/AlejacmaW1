using Toybox.System;
using Toybox.WatchUi as Ui;

class Time extends Ui.Drawable {
	hidden var _borderColor, _backgroundColor, _color;
	hidden var _y;
	hidden var _height;
	hidden var _border;

	function initialize(params) {
		Drawable.initialize(params);
		
		_color = params.get(:color);
		_borderColor = params.get(:borderColor);
		_backgroundColor = params.get(:backgroundColor);
		_y = params.get(:y);
		_height = params.get(:height);
		_border = params.get(:border);
	}
	
	function draw(dc) {
		var width = dc.getWidth();
		
		// Draw background
		dc.setColor(_borderColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[0, _y + 25],
			[82, _y + 25],
			[112, _y],
			[width, _y],
			[width, _y + _height - 1],
			[0, _y + _height - 1]
		]);
		dc.setColor(_backgroundColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[0, _y + 25 + _border],
			[83, _y + 25 + _border],
			[113, _y + _border],
			[width, _y + _border],
			[width, _y + _height - _border - 1],
			[0, _y + _height - _border - 1]
		]);
		
		// Draw current time
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        }
        var time = Lang.format("$1$:$2$", [hours, clockTime.min.format("%02d")]);
        
        dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
        var font = Ui.loadResource(Rez.Fonts.Tech64Font);
        var fontHeight = dc.getFontHeight(font);
		dc.drawText(width / 2 + 26, _y + _height / 2 - fontHeight / 2, font, time, Graphics.TEXT_JUSTIFY_CENTER);		
        
  	}
}