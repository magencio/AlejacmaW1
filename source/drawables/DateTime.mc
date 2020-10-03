using Toybox.Lang;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.WatchUi as Ui;

class DateTime extends Ui.Drawable {

	function initialize() {
		Drawable.initialize({ :identifier => "DateTime" });
	}
	
	function draw(dc) {
		var clockTime = System.getClockTime();
		var is24Hour = System.getDeviceSettings().is24Hour;
		
		drawTime(dc, clockTime, is24Hour);
		if (!is24Hour) {		
			drawAMPM(dc, clockTime);
		}
		drawDate(dc);
		drawAlarm(dc, is24Hour);
  	}
  	
  	function drawTime(dc, clockTime, is24Hour) {
		var x = $.SCREEN_WIDTH / 2 + 36 - (is24Hour ? 0 : 2), y = 183;

  		var hours = clockTime.hour;
  		hours = !is24Hour && hours > 12 ? hours - 12 : hours; 
        var time = Lang.format("$1$:$2$", [hours, clockTime.min.format("%02d")]);
        
        dc.setColor($.colorTime, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.fontLarge, time, Graphics.TEXT_JUSTIFY_CENTER);  	
  	} 
  	
  	function drawAMPM(dc, clockTime) {  		
  		var x = $.SCREEN_WIDTH - 44, y = 188;
  		
  		var text = clockTime.hour > 12 ? "PM" : "AM";
  		
        dc.setColor($.colorTimeAmPm, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, $.fontSmall, text, Graphics.TEXT_JUSTIFY_LEFT);
  	}
  	
  	function drawDate(dc) {
  		var x = $.SCREEN_WIDTH / 2 - 32, y = 206;

		var date = Gregorian.info(Time.now(), Time.FORMAT_LONG);
        var day = Lang.format("$1$ $2$ $3$", [date.day_of_week, date.day, date.month]);
        
        dc.setColor($.colorDate, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, $.fontSmall, day, Graphics.TEXT_JUSTIFY_RIGHT);  	
  	}
  	
  	function drawAlarm(dc, is24Hour) {
  		var x = $.SCREEN_WIDTH - (is24Hour ? 36 : 45), y = is24Hour ? 187 : 204;
  		
		var color = System.getDeviceSettings().alarmCount > 0 ? $.colorAlarmActive : $.colorAlarmInactive;
		
		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.fontIcons, $.ICON_ALARM, Graphics.TEXT_JUSTIFY_LEFT);
  	}
}