using Toybox.System;
using Toybox.Weather;
using Toybox.WatchUi as Ui;

class Weather extends Ui.Drawable {
	hidden var _borderColor, _backgroundColor, _color;
	hidden var _y;
	hidden var _height;
	hidden var _border;

	function initialize(params) {
		Drawable.initialize(params);
		
		_borderColor = params.get(:borderColor);
		_backgroundColor = params.get(:backgroundColor);
		_color = params.get(:color);
		_y = params.get(:y);
		_height = params.get(:height);
		_border = params.get(:border);
	}
	
	function draw(dc) {
		var width = dc.getWidth();
		
		var settings = System.getDeviceSettings();
		var weather = Weather.getCurrentConditions();
		
		// Draw background
		dc.setColor(_borderColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[0, _y],
			[width, _y],
			[width, _y + _height - 22],
			[width - 46, _y + _height - 22],
			[width - 50, _y + _height - 18],
			[width - 50, _y + _height - 5],
			[width - 54, _y + _height - 1],
			[112, _y + _height - 1],
			[82, _y + _height - 26],
			[0, _y + _height - 26],
		]);
	
		dc.setColor(_backgroundColor, Graphics.COLOR_TRANSPARENT);		
		dc.fillPolygon([
			[0, _y + _border],
			[width, _y + _border],
			[width, _y + _height - _border - 22],
			[width - _border - 46, _y + _height - _border - 22],
			[width - _border - 50, _y + _height - _border - 18],
			[width - _border - 50, _y + _height - _border - 5],
			[width - _border - 54, _y + _height - _border - 1],
			[115 - _border, _y + _height - _border - 1],
			[85 - _border, _y + _height - _border - 26],
			[0, _y + _height - _border - 26],
		]);
		
		// Draw location name
		var observationLocationName = weather.observationLocationName ? weather.observationLocationName: "--------";
		dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
		var font = Ui.loadResource(Rez.Fonts.Tech18Font);
		var fontHeight = dc.getFontHeight(font);
		dc.drawText(width / 2 + 28, _y + _height - fontHeight - _border - 5, font, observationLocationName, Graphics.TEXT_JUSTIFY_CENTER);	
		
		// TODO
		var units = settings.temperatureUnits; // 0 for celsius
		var condition = weather.condition; // 1
		var temperature = weather.temperature;
		var highTemperature = weather.highTemperature;
		var lowTemperature = weather.lowTemperature;
		var precipitationChance = weather.precipitationChance;				
	}
}