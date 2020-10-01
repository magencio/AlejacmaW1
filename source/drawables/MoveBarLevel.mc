using Toybox.ActivityMonitor;
using Toybox.WatchUi as Ui;

class MoveBarLevel extends Ui.Drawable {

	const MAX_BARS = 5;
	
	function initialize() {
		Drawable.initialize({ :identifier => "MoveBarLevel" });
	}
	
	function draw(dc) {
		var x = 252, y = 178;

		var activity = ActivityMonitor.getInfo();

		var moveReference = ActivityMonitor.MOVE_BAR_LEVEL_MAX - ActivityMonitor.MOVE_BAR_LEVEL_MIN;
		var moveBarLevel = (activity.moveBarLevel - ActivityMonitor.MOVE_BAR_LEVEL_MIN) / moveReference * MAX_BARS;
		
		for (var i = MAX_BARS; i > 0; i -= 1) {
			var active = moveBarLevel >= i;
			
			dc.setColor($.areaBorderColor, Graphics.COLOR_TRANSPARENT);
			var barY = y + (MAX_BARS - i) * 9;
			dc.fillPolygon([
				[x, barY + 1],
				[x + 1, barY],
				[x + 30, barY],
				[x + 30, barY + 6],
				[x, barY + 6]]);
			
			if (active) {
				dc.setColor($.areaBackgroundColor, Graphics.COLOR_TRANSPARENT);
				dc.fillPolygon([
					[x + $.BORDER, barY + 1 + $.BORDER],
					[x + 1 + $.BORDER, barY + $.BORDER],
					[x + 30, barY + 1 + $.BORDER],
					[x + 30, barY + 6],
					[x + $.BORDER, barY + 6]]);
			}			
		}
	}
}