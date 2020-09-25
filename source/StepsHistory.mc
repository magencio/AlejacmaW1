using Toybox.ActivityMonitor;
using Toybox.System;
using Toybox.WatchUi as Ui;

class StepsHistory extends Ui.Drawable {
	hidden var _color, _goalColor;
	hidden var _x, _y;
	hidden var _barHeight, _barWidth, _padding;
	
	const MAX_BARS = 8;
	
	function initialize(params) {
		Drawable.initialize(params);
		
		_color = params.get(:color);
		_goalColor = params.get(:goalColor);
		_x = params.get(:x); // Optional
		_y = params.get(:y); // Optional
		_barHeight = params.get(:barHeight);
		_barWidth = params.get(:barWidth);
		_padding = params.get(:padding);
	}

	function draw(dc) {
		
		var history = ActivityMonitor.getHistory();		
		if (history == null) {
			return;
		}

		var activity = ActivityMonitor.getInfo();
		
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
		
		// If we got no _x param, center the bars horizontally
		if (_x == null) {
			_x = (dc.getWidth() - MAX_BARS * _barWidth - (MAX_BARS - 1) * _padding) / 2;
		}
		
		// If we got no _y param, center the bars vertically
		if (_y == null) {
			_y = (dc.getHeight() - _barHeight) / 2;
		}		
		
		// Draw background bars
		dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
		for (var i = 0, x = _x; i < 8; i += 1, x +=_barWidth + _padding) {
			dc.drawRectangle(x, _y, _barWidth, _barHeight);					
		}
		
		// Draw history bars
		var size = MAX_BARS - 1;
		if (history.size() < size) {
			size = history.size();
		}

		for (var i = size - 1, x = _x; i >= 0; i -= 1, x += _barWidth + _padding) {
			if (history[i] != null) {
				if (history[i].steps != null) {						
					if (history[i].steps >= history[i].stepGoal) {
						dc.setColor(_goalColor, Graphics.COLOR_TRANSPARENT);
					} else {
						dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
					}					
					var stepHeight = _barHeight * history[i].steps / topSteps; 
        			dc.fillRectangle(x, _y + _barHeight - stepHeight, _barWidth, stepHeight);		
        			
        			// Draw history goal line
					if (history[i].steps < history[i].stepGoal) {
						var goalHeight = _barHeight * history[i].stepGoal / topSteps;
						var y = _y + _barHeight - goalHeight;
						dc.setColor(_goalColor, Graphics.COLOR_TRANSPARENT);
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
		var x = _x + (MAX_BARS - 1) * (_barWidth + _padding);
		dc.fillRectangle(x, _y + _barHeight - stepHeight, _barWidth, stepHeight);
		
		// Draw today's goal line
		if (activity.steps < activity.stepGoal) {
			var goalHeight = _barHeight * activity.stepGoal / topSteps;
			var y = _y + _barHeight - goalHeight;
			dc.setColor(_goalColor, Graphics.COLOR_TRANSPARENT);
			dc.drawLine(x, y, x + _barWidth, y);
		}			
	}
}