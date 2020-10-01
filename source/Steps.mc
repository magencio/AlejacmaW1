using Toybox.WatchUi as Ui;

class Steps extends Ui.Drawable {
	hidden var _stepsFont, _iconFont;	
	
	function initialize() {
		Drawable.initialize({ :identifier => "Steps" });
				
		_stepsFont = Ui.loadResource(Rez.Fonts.Tech24Font);
		_iconFont = Ui.loadResource(Rez.Fonts.IconsFont);
	}
	
	function draw(dc) {
		drawProgressLine(dc);
		drawSteps(dc);
		drawIcons(dc);
	}
	
	function drawProgressLine(dc) {
		var x = 52, y = 30;
		
		var steps = ActivityMonitor.getInfo().steps;
		var stepGoal = ActivityMonitor.getInfo().stepGoal;
		
		var maxWidth = $.SCREEN_WIDTH - x * 2; 
		var progress = maxWidth * steps / stepGoal;
		progress = progress > maxWidth ? maxWidth : progress;
			
		dc.setColor($.stepsGoalColor, Graphics.COLOR_TRANSPARENT);
		dc.drawLine(x, y, x + progress, y);
		dc.fillRectangle(x + progress - 2, y - 2, 5, 5);	
	}
	
	function drawSteps(dc) {
		var x = $.SCREEN_WIDTH / 2, y = 2;
		
		var steps = ActivityMonitor.getInfo().steps;
		steps = steps > 99999 ? 99999 : steps;  
		steps = steps.format("%04d");
		
		dc.setColor($.foregroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, _stepsFont, steps, Graphics.TEXT_JUSTIFY_CENTER);
	}
	
	function drawIcons(dc) {
		var x1 = $.SCREEN_WIDTH / 2 - 36, x2 = $.SCREEN_WIDTH / 2 + 37, y = 4;
		
		dc.setColor($.foregroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x1, y, _iconFont, $.ICON_STEPS, Graphics.TEXT_JUSTIFY_CENTER);		
		dc.drawText(x2, y, _iconFont, $.ICON_STEPS, Graphics.TEXT_JUSTIFY_CENTER);			
	}
}