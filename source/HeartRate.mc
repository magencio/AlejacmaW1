using Toybox.Activity;
using Toybox.ActivityMonitor;
using Toybox.WatchUi as Ui;

class HeartRate extends Ui.Drawable {
	hidden var _borderColor, _backgroundColor, _textColor, _heartColor;
	hidden var _x, _y;
	hidden var _width, _height;
	hidden var _border;
	
	function initialize(params) {
		Drawable.initialize(params);
		
		_borderColor = params.get(:borderColor);
		_backgroundColor = params.get(:backgroundColor);
		_textColor = params.get(:textColor);
		_heartColor = params.get(:heartColor);
		_x = params.get(:x); // Optional
		_y = params.get(:y); // Optional		
		_width = params.get(:width);
		_height = params.get(:height);
		_border = params.get(:border);
	}
	
	function draw(dc) {
		// If we got no _x param, center the bars horizontally
		if (_x == null) {
			_x = (dc.getWidth() - _width) / 2;
		}
		
		// If we got no _y param, center the bars vertically
		if (_y == null) {
			_y = (dc.getHeight() - _height - 14) / 2;
		}
	
		// Draw background
		dc.setColor(_borderColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[_x, _y + 10],
			[_x + 5, _y],
			[_x + width - 18, _y],
			[_x + width - 1, _y + 14],
			[_x + width - 1, _y + height - 15],
			[_x + width - 18, _y + height - 1],
			[_x + 5, _y + height - 1],
			[_x, _y + height - 11]
		]);
		dc.setColor(_backgroundColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[_x + _border, _y + _border + 10],
			[_x + _border + 5, _y + _border],
			[_x + width - _border - 18, _y + _border],
			[_x + width - _border - 1, _y + _border + 14],
			[_x + width - _border - 1, _y + height - _border - 14],
			[_x + width - _border - 17, _y + height - _border - 1],
			[_x + _border + 5, _y + height - _border - 1],
			[_x + _border, _y + height - _border - 11]
		]);
		
		// Draw icon
		dc.setColor(_textColor, Graphics.COLOR_TRANSPARENT);
		var font = Ui.loadResource(Rez.Fonts.IconsFont);
		dc.drawText(_x + _width / 2 - 24, _y + _border, font, 109.toChar(), Graphics.TEXT_JUSTIFY_CENTER);		
		
		// Draw text
		font = Ui.loadResource(Rez.Fonts.Tech18Font);
		var fontHeight = dc.getFontHeight(font);
		dc.drawText(_x + _width / 2 + 8, _y + _border + 2, font, "HEART", Graphics.TEXT_JUSTIFY_CENTER);
		dc.drawText(_x + _width / 2, _y + _height - _border - fontHeight - 4, font, "RATE", Graphics.TEXT_JUSTIFY_CENTER);
				
		// Draw heart rate
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
		font = Ui.loadResource(Rez.Fonts.Tech48Font);
		dc.setColor(_heartColor, Graphics.COLOR_TRANSPARENT);		
		dc.drawText(_x + width / 2, _y + _border + 17, font, heartRate, Graphics.TEXT_JUSTIFY_CENTER);
	}
}