using Toybox.Graphics;
using Toybox.StringUtil;
using Toybox.System;
using Toybox.Weather;
using Toybox.WatchUi as Ui;

class Weather extends Ui.Drawable {
	hidden var _areaForegroundColor, _lowTemperatureColor, _highTemperatureColor;
	hidden var _screenHeight, _screenWidth;
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

	function initialize() {
		Drawable.initialize({ :identifier => "Weather" });
		
		_screenWidth = System.getDeviceSettings().screenWidth;
		_border = Background.BORDER;
		
		_font = Ui.loadResource(Rez.Fonts.Tech18Font);				
	}
	
	function draw(dc) {
		_areaForegroundColor = Application.getApp().getProperty("AreaForegroundColor");
		_lowTemperatureColor = Application.getApp().getProperty("LowTemperatureColor");
		_highTemperatureColor = Application.getApp().getProperty("HighTemperatureColor");
						
		if (Weather.getCurrentConditions() == null) {
			drawUnavailableWeather(dc);
			return;
		}
		
		drawWeatherCondition(dc);
		drawCurrentTemperature(dc);
		drawLowTemperature(dc);
		drawHighTemperature(dc);
		drawPrecipitationChance(dc);
		drawLocation(dc);		
	}
	
	function drawUnavailableWeather(dc) {
		var x = _screenWidth / 2 + 20, y= 57;
		
		var message = Ui.loadResource(Rez.Strings.NoWeatherData);

		dc.setColor(_areaForegroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, _font, message, Graphics.TEXT_JUSTIFY_CENTER);	
	}
	
	function drawWeatherCondition(dc) {
		var x = 46, y = 38;
		
		var condition = Weather.getCurrentConditions().condition;		
		condition = Ui.loadResource(CONDITIONS[condition]);

		dc.setColor(_areaForegroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, _font, condition, Graphics.TEXT_JUSTIFY_LEFT);	
	}
	
	function drawCurrentTemperature(dc) {
		var x = _screenWidth / 2 - 34, y = 57;

		drawTemperature(dc, _areaForegroundColor, x, y, Weather.getCurrentConditions().temperature);
	}
	
	function drawLowTemperature(dc) {
		var x = _screenWidth / 2 + 11, y = 57;

		drawTemperature(dc, _lowTemperatureColor, x, y, Weather.getCurrentConditions().lowTemperature);
	}
	
	function drawHighTemperature(dc) {
		var x = _screenWidth / 2 + 56, y = 57;

		drawTemperature(dc, _highTemperatureColor, x, y, Weather.getCurrentConditions().highTemperature);
	}
	
	function drawTemperature(dc, color, x, y, temperature) {	
		// Temperature
		var units = System.getDeviceSettings().temperatureUnits == System.UNIT_STATUTE ? "F" : "C";
		temperature = units.equals("F") ? temperature * 1.8 + 32 : temperature;
		temperature = temperature.format("%d");

		var temperatureWidth = dc.getTextWidthInPixels(temperature, _font);
		var degreesWidth = 4;
		var unitsWidth = dc.getTextWidthInPixels(units, _font);
		var width = temperatureWidth + 2 + degreesWidth + 2 + unitsWidth;

		x = x - width / 2;

		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, _font, temperature, Graphics.TEXT_JUSTIFY_LEFT);
				
		// Degree glyph (not available in any font under resources/fonts)
		x = x + temperatureWidth + 2;

		dc.setPenWidth(1);
		dc.drawRectangle(x, y + 4, degreesWidth, degreesWidth);
		
		// Units
		x = x + degreesWidth + 2;

		dc.drawText(x, y, _font, units, Graphics.TEXT_JUSTIFY_LEFT);
	}
	
	function drawPrecipitationChance(dc) {
		var x = _screenWidth / 2 + 101, y = 57;
		
		// Precipitation chance
		var precipitationChance = Weather.getCurrentConditions().precipitationChance;			
		precipitationChance = precipitationChance.format("%d");
	
		var chanceWidth = dc.getTextWidthInPixels(precipitationChance, _font);
		var percentageWidth = 14;
		var width = chanceWidth + 2 + percentageWidth;
		
		x = x - width / 2;

		dc.setColor(_areaForegroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, _font, precipitationChance, Graphics.TEXT_JUSTIFY_LEFT);

		// Percentage glyph (not available in any font under resources/fonts)
		x = x + chanceWidth + 2;
		
		dc.drawRectangle(x, y + 4, 4, 4);
		dc.drawLine(x + 7, y + 4, x + 2, y + 15);
		dc.drawRectangle(x + 6, y + 12, 4, 4);
	}
	
	function drawLocation(dc) {
		var x = _screenWidth / 2 + 28, y = 75;

		// Draw location name e.g. "Leganés, España" will look like "LEGANES".
		// As Tech18Font by default doesn't support Spanish accents, I've modified the
		// .fnt file so e.g. 'Á' (193) points to the same bitmap as 'A' (65).
		var observationLocationName = Weather.getCurrentConditions().observationLocationName;		
		observationLocationName = observationLocationName == null ? "--------" : observationLocationName;
		var comma = observationLocationName.find(",");
		observationLocationName = observationLocationName.substring(0, comma == null || comma > 15 ? 15 : comma);

		dc.setColor(_areaForegroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, _font, observationLocationName, Graphics.TEXT_JUSTIFY_CENTER);			
	}
}