using Toybox.ActivityMonitor;
using Toybox.WatchUi as Ui;

class MoveBarLevel extends Ui.Drawable {

	const MAX_BARS = 5;
	
	function initialize() {
		Drawable.initialize({ :identifier => "MoveBarLevel" });
	}
	
	function draw(dc) {
		var x = 0, y = 173;

		var activity = ActivityMonitor.getInfo();

		var moveReference = ActivityMonitor.MOVE_BAR_LEVEL_MAX - ActivityMonitor.MOVE_BAR_LEVEL_MIN;
		var moveBarLevel = (activity.moveBarLevel - ActivityMonitor.MOVE_BAR_LEVEL_MIN) / moveReference * MAX_BARS;
		
		dc.setColor(moveBarLevel >= 1 ? $.foregroundColor : $.disabledColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x + 80, y + 1],
			[x + 81, y],
			[x + 84, y],
			[x + 85, y + 1],
			[x + 85, y + 11],
			[x + 84, y + 12],
			[x + 81, y + 12],
			[x + 80, y + 11]]);
		dc.setColor(moveBarLevel >= 2 ? $.foregroundColor : $.disabledColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x + 70, y + 1],
			[x + 71, y],
			[x + 76, y],
			[x + 77, y + 1],
			[x + 77, y + 11],
			[x + 76, y + 12],
			[x + 71, y + 12],
			[x + 70, y + 11]]);
		dc.setColor(moveBarLevel >= 3 ? $.foregroundColor : $.disabledColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x + 58, y + 1],
			[x + 59, y],
			[x + 66, y],
			[x + 67, y + 1],
			[x + 67, y + 11],
			[x + 66, y + 12],
			[x + 59, y + 12],
			[x + 58, y + 11]]);
		dc.setColor(moveBarLevel >= 4 ? $.foregroundColor : $.disabledColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x + 41, y + 1],
			[x + 42, y],
			[x + 54, y],
			[x + 55, y + 1],
			[x + 55, y + 11],
			[x + 54, y + 12],
			[x + 42, y + 12],
			[x + 41, y + 11]]);
		dc.setColor(moveBarLevel == MAX_BARS ? $.foregroundColor : $.disabledColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y + 1],
			[x + 1, y],
			[x + 37, y],
			[x + 38, y + 1],
			[x + 38, y + 11],
			[x + 37, y + 12],
			[x + 1, y + 12],
			[x, y + 11]]);		
	}
}