using Toybox.System;
using Toybox.WatchUi as Ui;

class Notifications extends Ui.Drawable {
	
	function initialize() {
		Drawable.initialize({ :identifier => "Notifications" });
	}
	
	function draw(dc) {		
		var notifications = System.getDeviceSettings().notificationCount;
		notifications = notifications > 99 ? 99 : notifications;
		var color = notifications > 0 ? $.colorNotificationsActive: $.colorNotificationsInactive;

		drawNotificationCount(dc, notifications, color);
		drawNotificationIcon(dc, color);
	}
	
	function drawNotificationCount(dc, notifications, color) {
		var x = 67, y = 229;

		notifications = notifications.format("%02d");

		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, $.fontSmall, notifications, Graphics.TEXT_JUSTIFY_RIGHT);	
	}
	
	function drawNotificationIcon(dc, color) {
		var x = 71, y = 233;

		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.fillPolygon([
        	[x, y + 1],
        	[x + 1, y],
        	[x + 10, y],
        	[x + 11, y + 1],
        	[x + 11, y + 8],
        	[x + 10, y + 9],
        	[x + 5, y + 9],
        	[x + 2, y + 12],
        	[x + 2, y + 9],
        	[x + 1, y + 9],
        	[x, y + 8]]);
        
        dc.setPenWidth(1);
        dc.setColor($.colorBackground, Graphics.COLOR_TRANSPARENT);
        dc.drawPoint(x + 2, y + 4);
        dc.drawPoint(x + 5, y + 4);
        dc.drawPoint(x + 8, y + 4);
	}	
}