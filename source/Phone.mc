using Toybox.System;
using Toybox.WatchUi as Ui;

class Phone extends Ui.Drawable {
	hidden var _foregroundColor, _disabledColor;
	hidden var _notificationsFont, _iconFont;
	
	const ICON_PHONE = 107.toChar(); // 'k'
	
	function initialize() {
		Drawable.initialize({ :identifier => "Phone" });
		
		_foregroundColor = Application.getApp().getProperty("ForegroundColor");
		_disabledColor = Application.getApp().getProperty("DisabledColor");
		
		_notificationsFont = Ui.loadResource(Rez.Fonts.Tech18Font);
		_iconFont = Ui.loadResource(Rez.Fonts.IconsFont);
	}
	
	function draw(dc) {
		drawNotifications(dc);
		drawPhoneConnected(dc);
	}
	
	function drawNotifications(dc) {
		var x = 68, y = 229;

		var notifications = System.getDeviceSettings().notificationCount;
		var color = notifications > 0 ? _foregroundColor: _disabledColor;
		notifications = notifications.format("%02d");

		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, _notificationsFont, notifications, Graphics.TEXT_JUSTIFY_RIGHT);
	}
	
	function drawPhoneConnected(dc) {
		var x = 70, y = 227;

		var phoneConnected = System.getDeviceSettings().phoneConnected;

		dc.setColor(phoneConnected ? _foregroundColor : _disabledColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, _iconFont, ICON_PHONE, Graphics.TEXT_JUSTIFY_LEFT);	
	}
}