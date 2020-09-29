using Toybox.Lang;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.WatchUi as Ui;

class DateTime extends Ui.Drawable {
	hidden var _borderColor, _backgroundColor, _color, _disabledColor;
	hidden var _y;
	hidden var _height;
	hidden var _border;

	function initialize(params) {
		Drawable.initialize(params);
		
		_borderColor = params.get(:borderColor);
		_backgroundColor = params.get(:backgroundColor);
		_color = params.get(:color);
		_disabledColor = params.get(:disabledColor);
		_y = params.get(:y);
		_height = params.get(:height);
		_border = params.get(:border);
	}
	
	function draw(dc) {
		var width = dc.getWidth();
		
		var clockTime = System.getClockTime();		
		var date = Gregorian.info(Time.now(), Time.FORMAT_LONG);
		var settings = System.getDeviceSettings();
		
		// Draw background
		dc.setColor(_borderColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[0, _y + 25],
			[82, _y + 25],
			[112, _y],
			[width - 38, _y],
			[width - 34, _y + 4],
			[width - 34, _y + _height - 1],
			[90, _y + _height - 1],
			[86, _y + _height - 5],
			[86, _y + _height - 16],
			[82, _y + _height - 20],
			[0, _y + _height - 20],
		]);
		
		dc.setColor(_backgroundColor, Graphics.COLOR_TRANSPARENT);		
		dc.fillPolygon([
			[0, _y + 25 + _border],
			[83, _y + 25 + _border],
			[113, _y + _border],
			[width - _border - 38, _y + _border],
			[width - _border - 34, _y + _border + 4],
			[width - _border - 34, _y + _height - _border - 1],
			[91, _y + _height - _border - 1],
			[86 + _border, _y + _height - _border - 4],
			[86 + _border, _y + _height - _border - 15],
			[83, _y + _height - _border - 20],
			[0, _y + _height - _border - 20],
		]);
		
		// Draw current time
        var hours = clockTime.hour;
        if (!settings.is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        }
        var time = Lang.format("$1$:$2$", [hours, clockTime.min.format("%02d")]);
        
        dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
        var font = Ui.loadResource(Rez.Fonts.Tech60Font);
        var fontHeight = dc.getFontHeight(font);
		dc.drawText(width / 2 + 36, _y + _height / 2 - fontHeight / 2, font, time, Graphics.TEXT_JUSTIFY_CENTER);
		
		// Draw AM/PM	
        font = Ui.loadResource(Rez.Fonts.Tech18Font);
        dc.setColor(_disabledColor, Graphics.COLOR_TRANSPARENT);
        if (!settings.is24Hour) {
        	if (clockTime.hour > 12) {
	        	dc.drawText(width / 2 - 17, _y + 10, font, "PM", Graphics.TEXT_JUSTIFY_RIGHT);
	        } else {
	        	dc.drawText(width / 2 - 17, _y + 10, font, "AM", Graphics.TEXT_JUSTIFY_RIGHT);
	        }
	    }
        
        // Draw date
        dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
        var day = Lang.format("$1$ $2$ $3$", [date.day_of_week, date.day, date.month]);
        dc.drawText(width / 2 - 32, _y + _height / 2 - 7, font, day, Graphics.TEXT_JUSTIFY_RIGHT);

		// Draw alarm icon
		dc.setColor(settings.alarmCount > 0? _color : _disabledColor, Graphics.COLOR_TRANSPARENT);
		font = Ui.loadResource(Rez.Fonts.IconsFont);
		dc.drawText(width / 2 - 32, _y + _height / 2 + 10, font, 82.toChar(), Graphics.TEXT_JUSTIFY_RIGHT);	
  	}
}