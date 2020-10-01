using Toybox.Lang;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.WatchUi as Ui;

class DateTime extends Ui.Drawable {
	hidden var _height;
	hidden var _timeFont, _amPmFont, _dateFont, _iconFont;
	
	function initialize() {
		Drawable.initialize({ :identifier => "DateTime" });
				
		_height = 70;		
		
		_timeFont = Ui.loadResource(Rez.Fonts.Tech60Font);
		_amPmFont = Ui.loadResource(Rez.Fonts.Tech18Font);
		_dateFont = _amPmFont;
		_iconFont = Ui.loadResource(Rez.Fonts.IconsFont);
	}
	
	function draw(dc) {
		var clockTime = System.getClockTime();
		var is24Hour = System.getDeviceSettings().is24Hour;
		
		drawTime(dc, clockTime, is24Hour);
		if (!is24Hour) {		
			drawAMPM(dc, clockTime);
		}
		drawDate(dc);
		drawAlarm(dc);
  	}
  	
  	function drawTime(dc, clockTime, is24Hour) {
		var x = $.SCREEN_WIDTH / 2 + 36 - (is24Hour ? 0 : 4), y = 183;

  		var hours = clockTime.hour;
  		hours = !is24Hour && hours > 12 ? hours - 12 : hours; 
        var time = Lang.format("$1$:$2$", [hours, clockTime.min.format("%02d")]);
        
        dc.setColor($.areaForegroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, _timeFont, time, Graphics.TEXT_JUSTIFY_CENTER);  	
  	} 
  	
  	function drawAMPM(dc, clockTime) {  		
  		var x = $.SCREEN_WIDTH - 44, y = 183;
  		
  		var first = clockTime.hour > 12 ? "P" : "A";
  		
        dc.setColor($.amPmColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, _amPmFont, first, Graphics.TEXT_JUSTIFY_CENTER);
		dc.drawText(x, y + 14, _amPmFont, "M", Graphics.TEXT_JUSTIFY_CENTER);
  	}
  	
  	function drawDate(dc) {
  		var x = $.SCREEN_WIDTH / 2 - 32, y = 206;

		var date = Gregorian.info(Time.now(), Time.FORMAT_LONG);
        var day = Lang.format("$1$ $2$ $3$", [date.day_of_week, date.day, date.month]);
        
        dc.setColor($.areaForegroundColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, _dateFont, day, Graphics.TEXT_JUSTIFY_RIGHT);  	
  	}
  	
  	function drawAlarm(dc) {
  		var x = $.SCREEN_WIDTH / 2 - 32, y = 223;
  		
		var color = System.getDeviceSettings().alarmCount > 0 ? $.areaForegroundColor : $.areaDisabledColor;
		
		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, _iconFont, $.ICON_ALARM, Graphics.TEXT_JUSTIFY_RIGHT);
  	}
}