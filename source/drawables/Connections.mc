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

		dc.setColor(phoneConnected ? $.colorConnectionsActive : $.colorConnectionsInactive, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.fontIcons, $.ICON_PHONE, Graphics.TEXT_JUSTIFY_CENTER);
	}
	
	function drawBluetoothEnabled(dc) {
		var x = 37, y = 78;
		
		var bluetooth = System.getDeviceSettings().connectionInfo[:bluetooth];
		var bluetoothConnected = bluetooth != null && bluetooth.state == System.CONNECTION_STATE_CONNECTED;
		
		dc.setColor(bluetoothConnected ? $.colorConnectionsActive : $.colorConnectionsInactive, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.fontIcons, $.ICON_BLUETOOTH, Graphics.TEXT_JUSTIFY_CENTER);	
	}
	
	function drawWifiEnabled(dc) {
		var x = 56, y = 78;
		
		var wifi = System.getDeviceSettings().connectionInfo[:wifi];
		var wifiConnected = wifi != null && wifi.state == System.CONNECTION_STATE_CONNECTED;
		
		dc.setColor(wifiConnected ? $.colorConnectionsActive : $.colorConnectionsInactive, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.fontIcons, $.ICON_WIFI, Graphics.TEXT_JUSTIFY_CENTER);		
	}
	
	function drawDoNotDisturb(dc) {
		var x = 75, y = 78;
		
		var doNotDisturb = System.getDeviceSettings().doNotDisturb;
		
		dc.setColor(!doNotDisturb ? $.colorConnectionsActive : $.colorConnectionsInactive, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.fontIcons, $.ICON_PEOPLE, Graphics.TEXT_JUSTIFY_CENTER);		
	}	
}