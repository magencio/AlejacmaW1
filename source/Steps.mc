using Toybox.WatchUi as Ui;

class Steps extends Ui.Drawable {
	hidden var _color, _lineColor, _progressColor;
	
	function initialize(params) {
		Drawable.initialize(params);
		
		_color = params.get(:color);
		_lineColor = params.get(:lineColor);
		_progressColor = params.get(:progressColor);
	}
	
	function draw(dc) {
		var height = dc.getHeight();
		var width = dc.getWidth();
		
		var activity = ActivityMonitor.getInfo();

		// Draw line		
		dc.setColor(_lineColor, Graphics.COLOR_TRANSPARENT);
		dc.setPenWidth(2);
		var y = 30;
		dc.drawLine(52, y, width - 52, y);
		
		// Draw progress line
		var progress = (width - 52 * 2) * activity.steps /activity.stepGoal;
		if (progress > width - 52 * 2) {
			progress = width - 52 * 2;
		}
		dc.setColor(_progressColor, Graphics.COLOR_TRANSPARENT);
		dc.drawLine(52, y, 52 + progress, y);
		dc.fillRectangle(52 + progress - 2, y - 2, 5, 5);
		
		// Draw steps
		dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
		var steps = activity.steps.format("%04d");
		var font = Ui.loadResource(Rez.Fonts.Tech24Font);
		var fontHeight = dc.getFontHeight(font);
		dc.drawText(width / 2, y - fontHeight - 4, font, steps, Graphics.TEXT_JUSTIFY_CENTER);
		
		// Draw icon
		dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
		font = Ui.loadResource(Rez.Fonts.IconsFont);
		fontHeight = dc.getFontHeight(font);
		dc.drawText(width / 2 - 36, y - fontHeight - 8, font, 196.toChar(), Graphics.TEXT_JUSTIFY_CENTER);		
		dc.drawText(width / 2 + 37, y - fontHeight - 8, font, 196.toChar(), Graphics.TEXT_JUSTIFY_CENTER);		
	}
}