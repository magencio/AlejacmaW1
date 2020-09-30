using Toybox.ActivityMonitor;
using Toybox.WatchUi as Ui;

class MoveBarLevel extends Ui.Drawable {
	hidden var _areaBackgroundColor, _areaBorderColor;
	hidden var _border;
	
	const MAX_BARS = 5;
	
	function initialize() {
		Drawable.initialize({ :identifier => "MoveBarLevel" });
		
		_areaBackgroundColor = Application.getApp().getProperty("AreaBackgroundColor");
		_areaBorderColor = Application.getApp().getProperty("AreaBorderColor");
		_border = Background.BORDER;
	}
	
	function draw(dc) {
		var x = 252, y = 178;
		
		var activity = ActivityMonitor.getInfo();

		var moveReference = ActivityMonitor.MOVE_BAR_LEVEL_MAX - ActivityMonitor.MOVE_BAR_LEVEL_MIN;
		var moveBarLevel = (activity.moveBarLevel - ActivityMonitor.MOVE_BAR_LEVEL_MIN) / moveReference * MAX_BARS;
		
		for (var i = MAX_BARS; i > 0; i -= 1) {
			var active = moveBarLevel >= i;
			
			dc.setColor(_areaBorderColor, Graphics.COLOR_TRANSPARENT);
			var barY = y + (MAX_BARS - i) * 9;
			dc.fillPolygon([
				[x, barY + 1],
				[x + 1, barY],
				[x + 30, barY],
				[x + 30, barY + 6],
				[x, barY + 6]]);
			
			if (active) {
				dc.setColor(_areaBackgroundColor, Graphics.COLOR_TRANSPARENT);
				dc.fillPolygon([
					[x + _border, barY + 1 + _border],
					[x + 1 + _border, barY + _border],
					[x + 30, barY + 1 + _border],
					[x + 30, barY + 6],
					[x + _border, barY + 6]]);
			}			
		}
	}
}