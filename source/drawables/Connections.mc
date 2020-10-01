using Toybox.System;
using Toybox.WatchUi as Ui;

class Connections extends Ui.Drawable {
	
	function initialize() {
		Drawable.initialize({ :identifier => "Connections" });
	}
	
	function draw(dc) {
		drawPhoneConnected(dc);
		drawBluetoothEnabled(dc);
		drawWifiEnabled(dc);		
		drawDoNotDisturb(dc);
	}
	
	function drawPhoneConnected(dc) {
		var x = 20, y = 78;

		var phoneConnected = System.getDeviceSettings().phoneConnected;

		dc.setColor(phoneConnected ? $.foregroundColor : $.disabledColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.iconFont, $.ICON_PHONE, Graphics.TEXT_JUSTIFY_CENTER);
	}
	
	function drawBluetoothEnabled(dc) {
		var x = 37, y = 78;
		
		var bluetooth = System.getDeviceSettings().connectionInfo[:bluetooth];
		var bluetoothConnected = bluetooth != null && bluetooth.state == System.CONNECTION_STATE_CONNECTED;
		
		dc.setColor(bluetoothConnected ? $.foregroundColor : $.disabledColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.iconFont, $.ICON_BLUETOOTH, Graphics.TEXT_JUSTIFY_CENTER);	
	}
	
	function drawWifiEnabled(dc) {
		var x = 56, y = 78;
		
		var wifi = System.getDeviceSettings().connectionInfo[:wifi];
		var wifiConnected = wifi != null && wifi.state == System.CONNECTION_STATE_CONNECTED;
		
		dc.setColor(wifiConnected ? $.foregroundColor : $.disabledColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.iconFont, $.ICON_WIFI, Graphics.TEXT_JUSTIFY_CENTER);		
	}
	
	function drawDoNotDisturb(dc) {
		var x = 224, y = 78;
		
		var doNotDisturb = System.getDeviceSettings().doNotDisturb;
		
		dc.setColor(!doNotDisturb ? $.foregroundColor : $.disabledColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.iconFont, $.ICON_PEOPLE, Graphics.TEXT_JUSTIFY_CENTER);		
	}	
}