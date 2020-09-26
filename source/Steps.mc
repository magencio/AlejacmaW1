using Toybox.WatchUi as Ui;

class Steps extends Ui.Drawable {
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
		var y = 30;
		dc.drawLine(0, y, width, y);
		
		// Draw steps
		var steps = activity.steps.format("%04d");
		var font = Ui.loadResource(Rez.Fonts.Tech24Font);
		var fontHeight = dc.getFontHeight(font);
		dc.drawText(width / 2, y - fontHeight - 4, font, steps, Graphics.TEXT_JUSTIFY_CENTER);
		
		// Draw icon
		font = Ui.loadResource(Rez.Fonts.IconsFont);
		fontHeight = dc.getFontHeight(font);
		dc.drawText(width / 2 - 36, y - fontHeight - 8, font, 196.toChar(), Graphics.TEXT_JUSTIFY_CENTER);		
		dc.drawText(width / 2 + 37, y - fontHeight - 8, font, 196.toChar(), Graphics.TEXT_JUSTIFY_CENTER);		
	}
}