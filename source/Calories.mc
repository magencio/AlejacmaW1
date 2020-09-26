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
		var y = height - 23;
		dc.drawLine(0, y, width, y);
		
		// Draw calories
		var calories = activity.calories.format("%04d");
		var font = Ui.loadResource(Rez.Fonts.Tech18Font);
		dc.drawText(width / 2, y + 2, font, calories, Graphics.TEXT_JUSTIFY_CENTER);
		
		font = Ui.loadResource(Rez.Fonts.Tech16Font);
		var fontHeight = dc.getFontHeight(font);
		dc.drawText(width / 2 + 40, y + 2, font, "KC", Graphics.TEXT_JUSTIFY_RIGHT);
		
		// Draw icon
		font = Ui.loadResource(Rez.Fonts.IconsFont);
		dc.drawText(width / 2 - 32, y, font, 88.toChar(), Graphics.TEXT_JUSTIFY_CENTER);		
	}
}