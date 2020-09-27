using Toybox.ActivityMonitor;
using Toybox.WatchUi as Ui;

class MoveBarLevel extends Ui.Drawable {
	hidden var _activeColor, _inactiveColor;
	hidden var _x, _y;
	hidden var _border;
	
	const MAX_BARS = 5;
	
	function initialize(params) {
		Drawable.initialize(params);
		
		_activeColor = params.get(:activeColor);
		_inactiveColor = params.get(:inactiveColor);
		_x = params.get(:x);
		_y = params.get(:y);
		_border = params.get(:border);
	}
	
	function draw(dc) {
		var activity = ActivityMonitor.getInfo();

		var moveReference = ActivityMonitor.MOVE_BAR_LEVEL_MAX - ActivityMonitor.MOVE_BAR_LEVEL_MIN;
		var moveBarLevel = (activity.moveBarLevel - ActivityMonitor.MOVE_BAR_LEVEL_MIN) / moveReference * MAX_BARS;
		
		// Draw activity bars
		for (var i = MAX_BARS; i > 0; i -= 1) {
			var active = moveBarLevel >= i;
			dc.setColor(_inactiveColor, Graphics.COLOR_TRANSPARENT);
			var y = _y + (MAX_BARS - i) * 9;
			dc.fillPolygon([
				[_x, y + 1],
				[_x + 1, y],
				[_x + 30, y],
				[_x + 30, y + 6],
				[_x, y + 6],
			]);
			if (active) {
				dc.setColor(_activeColor, Graphics.COLOR_TRANSPARENT);
				dc.fillPolygon([
					[_x + _border, y + 1 + _border],
					[_x + 1 + _border, y + _border],
					[_x + 30, y + 1 + _border],
					[_x + 30, y + 6],
					[_x + _border, y + 6],
				]);
			}			
		}
	}
}