using Toybox.WatchUi as Ui;

class Ornaments extends Ui.Drawable {
	hidden var _color;
	
	function initialize(params) {
		Drawable.initialize(params);
		
		_color = params.get(:color);
	}
	
	function draw(dc) {
		var height = dc.getHeight();
		var width = dc.getWidth();
		
		if(dc has :setAntiAlias) {
			dc.setAntiAlias(true);
		}
		
		// Main top line
		dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
		var x = 0;
		var y = height / 2 - 62;
		dc.fillPolygon([
			[x + 75, y],
			[x + 80, y],
			[x + 111, y + 25],
			[x + width, y + 25],
			[x + width, y + 28],
			[x + 109, y + 28]]);
		dc.fillPolygon([
			[x + 67, y],
			[x + 72, y],
			[x + 85, y + 10],
			[x + 80, y + 10]
		]);
		dc.fillPolygon([
			[x + 57, y],
			[x + 64, y],
			[x + 77, y + 10],
			[x + 70, y + 10]
		]);
		dc.fillPolygon([
			[x + 45, y],
			[x + 54, y],
			[x + 67, y + 10],
			[x + 58, y + 10]
		]);
		dc.fillPolygon([
			[x + 28, y],
			[x + 42, y],
			[x + 55, y + 10],
			[x + 41, y + 10]
		]);
		dc.fillPolygon([
			[x, y],
			[x + 25, y],
			[x + 38, y + 10],
			[x, y + 10]
		]);
		
		// Main bottom line
		y = height / 2 + 58;
		dc.fillPolygon([
			[x + 75, y],
			[x + 80, y],
			[x + 111, y - 25],
			[x + width, y - 25],
			[x + width, y - 28],
			[x + 109, y - 28]]);
		dc.fillPolygon([
			[x + 67, y],
			[x + 72, y],
			[x + 85, y - 10],
			[x + 80, y - 10]
		]);
		dc.fillPolygon([
			[x + 57, y],
			[x + 64, y],
			[x + 77, y - 10],
			[x + 70, y - 10]
		]);
		dc.fillPolygon([
			[x + 45, y],
			[x + 54, y],
			[x + 67, y - 10],
			[x + 58, y - 10]
		]);
		dc.fillPolygon([
			[x + 28, y],
			[x + 42, y],
			[x + 55, y - 10],
			[x + 41, y - 10]
		]);
		dc.fillPolygon([
			[x, y],
			[x + 25, y],
			[x + 38, y - 10],
			[x, y - 10]
		]);
	}
}