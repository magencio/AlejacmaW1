using Toybox.System;
using Toybox.WatchUi as Ui;

class Phone extends Ui.Drawable {
	
	function initialize() {
		Drawable.initialize({ :identifier => "Phone" });
	}
	
	function draw(dc) {
		drawNotifications(dc);
		drawPhoneConnected(dc);
	}
	
	function drawNotifications(dc) {
		var x = 68, y = 229;

		var notifications = System.getDeviceSettings().notificationCount;
		var color = notifications > 0 ? $.foregroundColor: $.disabledColor;
		notifications = notifications.format("%02d");

		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, $.smallFont, notifications, Graphics.TEXT_JUSTIFY_RIGHT);
	}
	
	function drawPhoneConnected(dc) {
		var x = 70, y = 227;

		var phoneConnected = System.getDeviceSettings().phoneConnected;

		dc.setColor(phoneConnected ? $.foregroundColor : $.disabledColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.iconFont, $.ICON_PHONE, Graphics.TEXT_JUSTIFY_LEFT);	
	}
}