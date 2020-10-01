using Toybox.Activity;
using Toybox.ActivityMonitor;
using Toybox.WatchUi as Ui;

class HeartRate extends Ui.Drawable {
	hidden var _width;
	
	function initialize() {
		Drawable.initialize({ :identifier => "HeartRate" });
				
		_width = 104;
	}
	
	function draw(dc) {
		drawTopTitle(dc);
		drawBottomTitle(dc);
		drawHeartRate(dc);
	}
	
	function drawTopTitle(dc) {
		var x = _width / 2, y = 99;
		
		var title = Ui.loadResource(Rez.Strings.HeartRateTopTitle);
		var titleWidth = dc.getTextWidthInPixels(title, $.smallFont);
		
		dc.setColor($.areaForegroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x - titleWidth / 2 - 2, y - 2, $.iconFont, $.ICON_HEART, Graphics.TEXT_JUSTIFY_CENTER);		
	
		dc.drawText(x + 9, y, $.smallFont, title, Graphics.TEXT_JUSTIFY_CENTER);
	}
	
	function drawBottomTitle(dc) {
		var x = _width / 2, y = 159;
		
		var title = Ui.loadResource(Rez.Strings.HeartRateBottomTitle);
		
		dc.setColor($.areaForegroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.smallFont, title, Graphics.TEXT_JUSTIFY_CENTER);	
	}
	
	function drawHeartRate(dc) {
		var x = _width / 2, y = 114;
		
		var heartRate = Activity.getActivityInfo().currentHeartRate;
		if (heartRate == null) {		
			if(ActivityMonitor has :HeartRateIterator)
			{
				var iterator = ActivityMonitor.getHeartRateHistory(1, true);
	    		if (iterator != null) {
	    			var sample = iterator.next();
	    			if (sample.heartRate != ActivityMonitor.INVALID_HR_SAMPLE) {
						heartRate = sample.heartRate; 		
	    			}
				}
			}
		}
		
		heartRate = (heartRate != null) ? heartRate.format("%02d") : "--";
		
		dc.setColor($.heartRateColor, Graphics.COLOR_TRANSPARENT);		
		dc.drawText(x, y, $.bigFont, heartRate, Graphics.TEXT_JUSTIFY_CENTER);	
	}
}