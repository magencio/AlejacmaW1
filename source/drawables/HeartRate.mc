using Toybox.Activity;
using Toybox.ActivityMonitor;
using Toybox.WatchUi as Ui;

class HeartRate extends Ui.Drawable {
	function initialize() {
		Drawable.initialize({ :identifier => "HeartRate" });
	}
	
	function draw(dc) {
		drawTitle(dc);
		drawHeartRate(dc);
	}
	
	function drawTitle(dc) {
		var x = 14, y = 120;
		
		var title = Ui.loadResource(Rez.Strings.HeartRateTitle);
		
		dc.setColor($.areaForegroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.smallFont, title, Graphics.TEXT_JUSTIFY_CENTER);

		dc.drawText(x, y + 16, $.iconFont, $.ICON_HEART, Graphics.TEXT_JUSTIFY_CENTER);			
	}
	
	function drawHeartRate(dc) {
		var x = 60, y = 114;
		
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