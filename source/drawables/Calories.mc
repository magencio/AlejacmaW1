using Toybox.WatchUi as Ui;

class Calories extends Ui.Drawable {

	function initialize() {
		Drawable.initialize({ :identifier => "Calories" });
	}
	
	function draw(dc) {	
		drawCalories(dc);
		drawIcon(dc);
		drawUnits(dc);
	}
	
	function drawCalories(dc) {
		var x = $.SCREEN_WIDTH / 2, y = $.SCREEN_HEIGHT - 26;
		
		var calories = ActivityMonitor.getInfo().calories;
		calories = calories > 99999 ? 99999 : calories;  
		calories = calories.format("%04d");
		
		dc.setColor($.colorCalories, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.fontNormal, calories, Graphics.TEXT_JUSTIFY_CENTER);
	}
	
	function drawIcon(dc) {
		var x = $.SCREEN_WIDTH / 2 - 34, y = $.SCREEN_HEIGHT - 27;
		
		dc.setColor($.colorCalories, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.fontIcons, $.ICON_CALORIES, Graphics.TEXT_JUSTIFY_CENTER);			
	}
	
	function drawUnits(dc) {
		var x = $.SCREEN_WIDTH / 2 + 45, y = $.SCREEN_HEIGHT - 23;
		
		dc.setColor($.colorCalories, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.fontTiny, "KC", Graphics.TEXT_JUSTIFY_RIGHT);					
	}
}