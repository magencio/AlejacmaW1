using Toybox.Lang;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.WatchUi as Ui;

class DateTime extends Ui.Drawable {
	hidden var _areaForegroundColor, _areaDisabledColor, _ampmColor;
	hidden var _y;
	hidden var _screenWidth, _height;
	hidden var _timeFont, _ampmFont, _dateFont, _iconFont;
	
	const ICON_ALARM = 82.toChar(); // 'R' 

	function initialize() {
		Drawable.initialize({ :identifier => "DateTime" });
		
		_areaForegroundColor = Graphics.COLOR_BLACK;
		_areaDisabledColor = Graphics.COLOR_LT_GRAY;
		_ampmColor = Graphics.COLOR_LT_GRAY;
		
		_height = 70;		
		_screenWidth = System.getDeviceSettings().screenWidth;
		
		_timeFont = Ui.loadResource(Rez.Fonts.Tech60Font);
		_ampmFont = Ui.loadResource(Rez.Fonts.Tech18Font);
		_dateFont = _ampmFont;
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
		var x = _screenWidth / 2 + 36 - (is24Hour ? 0 : 4), y = 183;

  		var hours = clockTime.hour;
  		hours = !is24Hour && hours > 12 ? hours - 12 : hours; 
        var time = Lang.format("$1$:$2$", [hours, clockTime.min.format("%02d")]);
        
        dc.setColor(_areaForegroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, _timeFont, time, Graphics.TEXT_JUSTIFY_CENTER);  	
  	} 
  	
  	function drawAMPM(dc, clockTime) {  		
  		var x = _screenWidth - 44, y = 183;
  		
  		var first = clockTime.hour > 12 ? "P" : "A";
  		
        dc.setColor(_ampmColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, _ampmFont, first, Graphics.TEXT_JUSTIFY_CENTER);
		dc.drawText(x, y + 14, _ampmFont, "M", Graphics.TEXT_JUSTIFY_CENTER);
  	}
  	
  	function drawDate(dc) {
  		var x = _screenWidth / 2 - 32, y = 206;

		var date = Gregorian.info(Time.now(), Time.FORMAT_LONG);
        var day = Lang.format("$1$ $2$ $3$", [date.day_of_week, date.day, date.month]);
        
        dc.setColor(_areaForegroundColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, _dateFont, day, Graphics.TEXT_JUSTIFY_RIGHT);  	
  	}
  	
  	function drawAlarm(dc) {
  		var x = _screenWidth / 2 - 32, y = 223;
  		
		var color = System.getDeviceSettings().alarmCount > 0 ? _areaForegroundColor : _areaDisabledColor;
		
		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, _iconFont, ICON_ALARM, Graphics.TEXT_JUSTIFY_RIGHT);
  	}
}