using Toybox.ActivityMonitor;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.WatchUi as Ui;

class StepsHistory extends Ui.Drawable {
	hidden var _backgroundColor, _color, _goalColor;
	hidden var _x, _y;
	hidden var _barHeight, _barWidth, _padding, _border;
	
	const MAX_BARS = 8;
	
	function initialize(params) {
		Drawable.initialize(params);
		
		_backgroundColor = params.get(:backgroundColor);
		_color = params.get(:color);
		_goalColor = params.get(:goalColor);
		_x = params.get(:x); // Optional
		_y = params.get(:y); // Optional
		_barHeight = params.get(:barHeight);
		_barWidth = params.get(:barWidth);
		_padding = params.get(:padding);
		_border = params.get(:border);
	}

	function draw(dc) {
		
		var history = ActivityMonitor.getHistory();		
		if (history == null) {
			return;
		}

		var activity = ActivityMonitor.getInfo();
        var date = Gregorian.info(Time.now(), Time.FORMAT_LONG);
		
		// If we got no _x param, center the bars horizontally
		var width = MAX_BARS * _barWidth + (MAX_BARS + 1) * _padding + _border * 2;
		if (_x == null) {
			_x = (dc.getWidth() - width) / 2;
		}
		
		// If we got no _y param, center the bars vertically
		var height = _barHeight + _padding + _border * 2;
		if (_y == null) {
			_y = (dc.getHeight() - height - 14) / 2;
		}
		
		// Draw background
		dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[_x, _y + _padding],
			[_x + _padding, _y],
			[_x + width - _padding - 1, _y],
			[_x + width - 1, _y + _padding],
			[_x + width - 1, _y + height - _padding / 2 - 1],
			[_x + width - _padding / 2 - 1, _y + height - 1],
			[_x + _padding / 2, _y + height - 1],
			[_x, _y + height - _padding / 2 - 1]]);
		dc.setColor(_backgroundColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[_x + _border, _y + _border + _padding - 1],
			[_x + _border + _padding - 1, _y + _border],
			[_x + width - _border - _padding - 1, _y + _border],
			[_x + width - _border - 1, _y + _border + _padding],
			[_x + width - _border - 1, _y + height - _border - _padding / 2 - 1],
			[_x + width - _border - _padding / 2 - 1, _y + height - _border - 1],
			[_x + _border + _padding / 2 - 1, _y + height - _border - 1],
			[_x + _border, _y + height - _border - _padding / 2]]);
			
		// Draw text for days
		var font = Ui.loadResource(Rez.Fonts.Tech16Font);
		dc.setColor(_backgroundColor, Graphics.COLOR_TRANSPARENT);
		for (var i = MAX_BARS - 1, x = _x + _border + _padding + _barWidth / 2; i >= 0; i -= 1, x += _barWidth + _padding) {
			dc.drawText(x, _y + height, font, (date.day - i).format("%02d"), Graphics.TEXT_JUSTIFY_CENTER);
		}

		// Number of steps represented by the top of the bars
		var topSteps = 0;
		for (var i = 0; i < history.size(); i += 1) {
			if (history[i].steps != null) {
				if (history[i].steps > topSteps) {
					topSteps = history[i].steps;
				}
				if (history[i].stepGoal > topSteps) {
					topSteps = history[i].stepGoal;
				}
			}	
		}
		
		if (activity.steps > topSteps) {
			topSteps = activity.steps;
		}
		if (activity.stepGoal > topSteps) {
			topSteps = activity.stepGoal;
		}
				
		// Draw history bars
		var size = MAX_BARS - 1;
		if (history.size() < size) {
			size = history.size();
		}

		for (var i = size - 1, x = _x + _border + _padding; i >= 0; i -= 1, x += _barWidth + _padding) {
			if (history[i] != null) {
				if (history[i].steps != null) {						
					if (history[i].steps >= history[i].stepGoal) {
						dc.setColor(_goalColor, Graphics.COLOR_TRANSPARENT);
					} else {
						dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
					}					
					var stepHeight = _barHeight * history[i].steps / topSteps; 
        			dc.fillRectangle(x, _y + _border + _padding + _barHeight - stepHeight, _barWidth, stepHeight);		
        			
        			// Draw history goal line
					if (history[i].steps < history[i].stepGoal) {
						dc.setColor(_goalColor, Graphics.COLOR_TRANSPARENT);
						var goalHeight = _barHeight * history[i].stepGoal / topSteps;
						var y = _y + _border + _padding + _barHeight - goalHeight;
						dc.drawLine(x, y, x + _barWidth, y);
					}				        						
				}
			}
		}
		
		// Draw today's bar
		if (activity.steps >= activity.stepGoal) {
			dc.setColor(_goalColor, Graphics.COLOR_TRANSPARENT);
		} else {
			dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
		}					
		var stepHeight = _barHeight * activity.steps / topSteps;
		var x = _x + width - _barWidth - _padding - _border;
		dc.fillRectangle(x, _y + _border + _padding + _barHeight - stepHeight, _barWidth, stepHeight);
		
		// Draw today's goal line
		if (activity.steps < activity.stepGoal) {
			dc.setColor(_goalColor, Graphics.COLOR_TRANSPARENT);
			var goalHeight = _barHeight * activity.stepGoal / topSteps;
			var y = _y + _border + _padding + _barHeight - goalHeight;
			dc.drawLine(x, y, x + _barWidth, y);
		}			
	}
}