using Toybox.Graphics;
using Toybox.StringUtil;
using Toybox.System;
using Toybox.Weather;
using Toybox.WatchUi as Ui;

class Weather extends Ui.Drawable {
	hidden var _borderColor, _backgroundColor, _color, _lowColor, _highColor;
	hidden var _x, _y;
	hidden var _height, _width, _fontHeight;
	hidden var _border;
	hidden var _font;
	
	const CONDITIONS = [
		Rez.Strings.ConditionClear,
		Rez.Strings.ConditionPartlyCloudy,
		Rez.Strings.ConditionMostlyCloudy,
		Rez.Strings.ConditionRain,
		Rez.Strings.ConditionSnow,
		Rez.Strings.ConditionWindy,
		Rez.Strings.ConditionThunderstorms,
		Rez.Strings.ConditionWintryMix,
		Rez.Strings.ConditionFog,
		Rez.Strings.ConditionHazy,
		Rez.Strings.ConditionHail,
		Rez.Strings.ConditionScatteredShowers,
		Rez.Strings.ConditionScatteredThunderstorms,
		Rez.Strings.ConditionUnknownPrecipitation,
		Rez.Strings.ConditionLightRain,
		Rez.Strings.ConditionHeavyRain,
		Rez.Strings.ConditionLightSnow,
		Rez.Strings.ConditionHeavySnow,
		Rez.Strings.ConditionLightRainSnow,
		Rez.Strings.ConditionHeavyRainSnow,
		Rez.Strings.ConditionCloudy,
		Rez.Strings.ConditionRainSnow,
		Rez.Strings.ConditionPartlyClear,
		Rez.Strings.ConditionMostlyClear,
		Rez.Strings.ConditionLightShowers,
		Rez.Strings.ConditionShowers,
		Rez.Strings.ConditionHeavyShowers,
		Rez.Strings.ConditionChanceOfShowers,
		Rez.Strings.ConditionChanceOfThunderstorms,
		Rez.Strings.ConditionMist,
		Rez.Strings.ConditionDust,
		Rez.Strings.ConditionDrizzle,
		Rez.Strings.ConditionTornado,
		Rez.Strings.ConditionSmoke,
		Rez.Strings.ConditionIce,
		Rez.Strings.ConditionSand,
		Rez.Strings.ConditionSquall,
		Rez.Strings.ConditionSandstorm,
		Rez.Strings.ConditionVolcanicAsh,
		Rez.Strings.ConditionHaze,
		Rez.Strings.ConditionFair,
		Rez.Strings.ConditionHurricane,
		Rez.Strings.ConditionTropicalStorm,
		Rez.Strings.ConditionChanceOfSnow,
		Rez.Strings.ConditionChanceOfRainSnow,
		Rez.Strings.ConditionCloudyChanceOfRain,
		Rez.Strings.ConditionCloudyChanceOfSnow,
		Rez.Strings.ConditionCloudyChanceOfRainSnow,
		Rez.Strings.ConditionFlurries,
		Rez.Strings.ConditionFreezingRain,
		Rez.Strings.ConditionSleet,
		Rez.Strings.ConditionIceSnow,
		Rez.Strings.ConditionThinClouds,
		Rez.Strings.ConditionUnknown,
	];

	function initialize(params) {
		Drawable.initialize(params);
		
		_borderColor = params.get(:borderColor) == null ? Graphics.COLOR_LT_GRAY : params.get(:borderColor);
		_backgroundColor = params.get(:backgroundColor) == null ? Graphics.COLOR_WHITE : params.get(:backgroundColor);
		_color = params.get(:color) == null ? Graphics.COLOR_BLACK : params.get(:color);
		_lowColor = params.get(:lowColor) == null ? Graphics.COLOR_BLUE : params.get(:lowColor);
		_highColor = params.get(:highColor) == null ? Graphics.COLOR_ORANGE : params.get(:highColor);
				
		_x = params.get(:x) == null ? 0 : params.get(:x);
		_y = params.get(:y) == null ? 0 : params.get(:y);
		
		_height = params.get(:height) == null ? System.getDeviceSettings().screenHeight : params.get(:height);
		_width = params.get(:width) == null ? System.getDeviceSettings().screenWidth : params.get(:width);
		_border = params.get(:border) == null ? 2 : params.get(:border);
		
		_font = Ui.loadResource(Rez.Fonts.Tech18Font);
		_fontHeight = Graphics.getFontHeight(_font);
	}
	
	function draw(dc) {
		var units = System.getDeviceSettings().temperatureUnits == System.UNIT_STATUTE ? "F" : "C";		
		var weather = Weather.getCurrentConditions();
		
		drawBackground(dc);
		
		var x = _x + _width / 2;
		if (weather == null) {
			drawUnavailableWeather(dc, x + 20, _y + _height / 2 - 2);
			return;
		}
		
		drawWeatherCondition(dc, x, _y + 11, weather.condition);
		
		x = x - 34;
		var y = _y + _height / 2 - 2;
		drawTemperature(dc, _color, x, y, weather.temperature, units);
		
		x = x + 45;
		drawTemperature(dc, _lowColor, x, y, weather.lowTemperature, units);
		
		x = x + 45;
		drawTemperature(dc, _highColor, x, y, weather.highTemperature, units);
		
		x = x + 45;
		drawPrecipitationChance(dc, x, y, weather.precipitationChance);
		
		x = _x + _width / 2 + 28;
		y = _y + _height - 24;
		drawLocation(dc, x, y, weather.observationLocationName);
	}
	
	function drawBackground(dc) {	
		dc.setColor(_borderColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[_x, _y],
			[_x + _width, _y],
			[_x + _width, _y + _height - 22],
			[_x + _width - 46, _y + _height - 22],
			[_x + _width - 50, _y + _height - 18],
			[_x + _width - 50, _y + _height - 5],
			[_x + _width - 54, _y + _height - 1],
			[_x + 112, _y + _height - 1],
			[_x + 82, _y + _height - 26],
			[_x + 0, _y + _height - 26],
		]);
	
		dc.setColor(_backgroundColor, Graphics.COLOR_TRANSPARENT);		
		dc.fillPolygon([
			[_x, _y + _border],
			[_x + _width, _y + _border],
			[_x + _width, _y + _height - _border - 22],
			[_x + _width - _border - 46, _y + _height - _border - 22],
			[_x + _width - _border - 50, _y + _height - _border - 18],
			[_x + _width - _border - 50, _y + _height - _border - 5],
			[_x + _width - _border - 54, _y + _height - _border - 1],
			[_x + 115 - _border, _y + _height - _border - 1],
			[_x + 85 - _border, _y + _height - _border - 26],
			[_x, _y + _height - _border - 26],
		]);
	}
	
	function drawUnavailableWeather(dc, x, y) {
		dc.setColor(_color, Graphics.COLOR_TRANSPARENT);

		dc.drawText(x, y - _fontHeight / 2, _font, "No weather data", Graphics.TEXT_JUSTIFY_CENTER);	
	}
	
	function drawWeatherCondition(dc, x, y, weatherCondition) {
		dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
		
		var condition = Ui.loadResource(CONDITIONS[weatherCondition]);
		
		dc.drawText(x, y - _fontHeight / 2, _font, condition, Graphics.TEXT_JUSTIFY_CENTER);	
	}
	
	function drawTemperature(dc, color, x, y, temperature, units) {
		dc.setColor(color, Graphics.COLOR_TRANSPARENT);

		temperature = units.equals("F") ? temperature * 1.8 + 32 : temperature;
		temperature = temperature.format("%d");

		var temperatureWidth = dc.getTextWidthInPixels(temperature, _font);
		var degreesWidth = 4;
		var unitsWidth = dc.getTextWidthInPixels(units, _font);
		var width = temperatureWidth + 2 + degreesWidth + 2 + unitsWidth;

		x = x - width / 2;
		y = y - _fontHeight / 2;
		dc.drawText(x, y, _font, temperature, Graphics.TEXT_JUSTIFY_LEFT);
		
		x = x + temperatureWidth + 2;
		dc.setPenWidth(1);
		dc.drawRectangle(x, y + 4, degreesWidth, degreesWidth);
		
		x = x + degreesWidth + 2;
		dc.drawText(x, y, _font, units, Graphics.TEXT_JUSTIFY_LEFT);
	}
	
	function drawPrecipitationChance(dc, x, y, precipitationChance) {
		dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
	
		precipitationChance = precipitationChance.format("%d");
	
		var chanceWidth = dc.getTextWidthInPixels(precipitationChance, _font);
		var percentageWidth = 14;
		var width = chanceWidth + 2 + percentageWidth;
		
		x = x - width / 2;
		y = y - _fontHeight / 2;
		dc.drawText(x, y, _font, precipitationChance, Graphics.TEXT_JUSTIFY_LEFT);
		
		x = x + chanceWidth + 2;
		dc.drawRectangle(x, y + 4, 4, 4);
		dc.drawLine(x + 7, y + 4, x + 2, y + 15);
		dc.drawRectangle(x + 6, y + 12, 4, 4);
	}
	
	function drawLocation(dc, x, y, observationLocationName) {
		// Draw location name e.g. "Leganés, España" will look like "LEGANES".
		// As Tech18Font by default doesn't support Spanish accents, I've modified the
		// .fnt file so e.g. 'Á' (193) points to the same bitmap as 'A' (65).
		observationLocationName = observationLocationName == null ? "--------" : observationLocationName;
		var comma = observationLocationName.find(",");
		observationLocationName = observationLocationName.substring(0, comma == null || comma > 15 ? 15 : comma);	
		dc.drawText(x, y, _font, observationLocationName, Graphics.TEXT_JUSTIFY_CENTER);			
	}
}