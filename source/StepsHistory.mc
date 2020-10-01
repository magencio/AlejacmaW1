using Toybox.ActivityMonitor;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.WatchUi as Ui;

class StepsHistory extends Ui.Drawable {
	hidden var _daysFont;
	
	const MAX_BARS = 8;
	const BAR_HEIGHT = 30;
	const BAR_WIDTH = 15;
	const PADDING = 5;
	
	function initialize() {
		Drawable.initialize({ :identifier => "StepsHistory" });
		
		_daysFont = Ui.loadResource(Rez.Fonts.Tech16Font);		
	}

	function draw(dc) {
		drawDays(dc);
		var topSteps = getTopSteps();		
		drawHistoryBars(dc, topSteps);
		drawTodayBar(dc, topSteps);
	}
	
	function getTopSteps() {
		// Calculates number of steps represented by the top of the bars		
		var history = ActivityMonitor.getHistory();
		var activity = ActivityMonitor.getInfo();
		
		var topSteps = 0;
		
		if (history != null) {
			for (var i = 0; i < history.size(); i += 1) {
				if (history[i].steps != null) {
					topSteps = history[i].steps > topSteps ? history[i].steps : topSteps;
					topSteps = history[i].stepGoal > topSteps ? history[i].stepGoal : topSteps;
				}	
			}
		}
				
		topSteps = activity.steps > topSteps ? activity.steps : topSteps;
		topSteps = activity.stepGoal > topSteps ? activity.stepGoal : topSteps;		
		return topSteps;
	}
	
	function drawDays(dc) {
		var x = 110 + $.BORDER + PADDING + BAR_WIDTH / 2, y = 151;
		
		var now = Time.now();

		dc.setColor($.foregroundColor, Graphics.COLOR_TRANSPARENT);
		
		for (var i = MAX_BARS - 1, textX = x; i >= 0; i -= 1, textX += BAR_WIDTH + PADDING) {
			
			var time = now.subtract(new Time.Duration(60 * 60 * 24 * i));
		    var date = Gregorian.info(time, Time.FORMAT_LONG);	
		    	    	
			dc.drawText(textX, y, _daysFont, date.day.format("%02d"), Graphics.TEXT_JUSTIFY_CENTER);
		}
	}
	
	function drawHistoryBars(dc, topSteps) {	
		var x = 110 + $.BORDER + PADDING, y = 111;
	
		var history = ActivityMonitor.getHistory();
		if (history == null) {
			return;
		}
		
		var size = MAX_BARS - 1;
		size = history.size() < size ? history.size() : size;

		dc.setPenWidth(2);
		for (var i = size - 1, barX = x ; i >= 0; i -= 1, barX += BAR_WIDTH + PADDING) {
			if (history[i] != null) {
				if (history[i].steps != null) {		
					var stepHeight = BAR_HEIGHT * history[i].steps / topSteps; 
					
					// Bar
					var color = history[i].steps >= history[i].stepGoal ? $.stepsGoalColor : $.stepsBarColor;			
					dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        			dc.fillRectangle(barX, y + $.BORDER + PADDING + BAR_HEIGHT - stepHeight, BAR_WIDTH, stepHeight);		
        			
        			// Goal line
					if (history[i].steps < history[i].stepGoal) {
						var goalHeight = BAR_HEIGHT * history[i].stepGoal / topSteps;
						var goalY = y + $.BORDER + PADDING + BAR_HEIGHT - goalHeight;

						dc.setColor($.stepsGoalColor, Graphics.COLOR_TRANSPARENT);
						dc.drawLine(barX, goalY, barX + BAR_WIDTH - 1, goalY);
					}				        						
				}
			}
		}
	}
	
	function drawTodayBar(dc, topSteps) {
		var x = 110 + $.BORDER + (MAX_BARS - 1) * BAR_WIDTH + (MAX_BARS) * PADDING, y = 111;
	
		var activity = ActivityMonitor.getInfo();
				
		// Bar
		var color = activity.steps >= activity.stepGoal ? $.stepsGoalColor : $.stepsBarColor;
		dc.setColor(color, Graphics.COLOR_TRANSPARENT);

		var stepHeight = BAR_HEIGHT * activity.steps / topSteps;
		dc.fillRectangle(x, y + $.BORDER + PADDING + BAR_HEIGHT - stepHeight, BAR_WIDTH, stepHeight);
		
		// Goal line
		if (activity.steps < activity.stepGoal) {
			dc.setColor($.stepsGoalColor, Graphics.COLOR_TRANSPARENT);
			var goalHeight = BAR_HEIGHT * activity.stepGoal / topSteps;
			var goalY = y + $.BORDER + PADDING + BAR_HEIGHT - goalHeight;
			dc.drawLine(x, goalY, x + BAR_WIDTH, goalY);
		}	
	}
}