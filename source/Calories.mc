using Toybox.WatchUi as Ui;

class Calories extends Ui.Drawable {
	hidden var _color;
	
	function initialize(params) {
		Drawable.initialize(params);
		
		_color = params.get(:color);
	}
	
	function draw(dc) {
		var height = dc.getHeight();
		var width = dc.getWidth();
	
		var activity = ActivityMonitor.getInfo();

		// Draw line		
		dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
		dc.setPenWidth(2);
		var y = height - 29;
		dc.drawLine(0, y, width, y);
		
		// Draw icon
		var font = Ui.loadResource(Rez.Fonts.IconsFont);
		dc.drawText(width / 2 - 34, y + 2, font, 88.toChar(), Graphics.TEXT_JUSTIFY_CENTER);		
		
		// Draw calories
		var calories = activity.calories;
		if (calories > 99999) {
			calories = 99999;
		}
		calories = calories.format("%04d");
		font = Ui.loadResource(Rez.Fonts.Tech24Font);
		dc.drawText(width / 2, y + 3, font, calories, Graphics.TEXT_JUSTIFY_CENTER);
		
		// Draw units
		font = Ui.loadResource(Rez.Fonts.Tech16Font);
		var fontHeight = dc.getFontHeight(font);
		dc.drawText(width / 2 + 45, y + 6, font, "KC", Graphics.TEXT_JUSTIFY_RIGHT);		
	}
}