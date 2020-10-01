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
	}
	
	function drawPhoneConnected(dc) {
		var x = 32, y = 56;

		var phoneConnected = System.getDeviceSettings().phoneConnected;

		dc.setColor(phoneConnected ? $.foregroundColor : $.disabledColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.iconFont, $.ICON_PHONE, Graphics.TEXT_JUSTIFY_CENTER);
	}
	
	function drawBluetoothEnabled(dc) {
		var x = 51, y = 56;
		
		var bluetooth = System.getDeviceSettings().connectionInfo[:bluetooth];
		var bluetoothConnected = bluetooth != null && bluetooth.state == System.CONNECTION_STATE_CONNECTED;
		
		dc.setColor(bluetoothConnected ? $.foregroundColor : $.disabledColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.iconFont, 86.toChar(), Graphics.TEXT_JUSTIFY_CENTER);	
	}
	
	function drawWifiEnabled(dc) {
		var x = 70, y = 55;
		
		var wifi = System.getDeviceSettings().connectionInfo[:wifi];
		var wifiConnected = wifi != null && wifi.state == System.CONNECTION_STATE_CONNECTED;
		
		dc.setColor(wifiConnected ? $.foregroundColor : $.disabledColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.iconFont, 207.toChar(), Graphics.TEXT_JUSTIFY_CENTER);		
	}
}