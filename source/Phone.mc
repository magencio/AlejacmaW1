using Toybox.System;
using Toybox.WatchUi as Ui;

class Phone extends Ui.Drawable {
	hidden var _color, _inactiveColor;
	hidden var _x, _y;
	
	function initialize(params) {
		Drawable.initialize(params);
		
		_color = params.get(:color);
		_inactiveColor = params.get(:inactiveColor);
		_x = params.get(:x);
		_y = params.get(:y);
	}
	
	function draw(dc) {
		var settings = System.getDeviceSettings();
		
		// Draw number of notifications
		var notifications = settings.notificationCount;
		dc.setColor(notifications > 0 ? _color: _inactiveColor, Graphics.COLOR_TRANSPARENT);
		var font = Ui.loadResource(Rez.Fonts.Tech18Font);
		var fontHeight = dc.getFontHeight(font);
        dc.drawText(_x - 1, _y - fontHeight / 2, font, notifications.format("%02d"), Graphics.TEXT_JUSTIFY_RIGHT);
		
		// Draw phone icon
		font = Ui.loadResource(Rez.Fonts.IconsFont);
		fontHeight = dc.getFontHeight(font);
		dc.setColor(settings.phoneConnected ? _color : _inactiveColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(_x + 1, _y - fontHeight / 2 - 1, font, 107.toChar(), Graphics.TEXT_JUSTIFY_LEFT);	
	}
}