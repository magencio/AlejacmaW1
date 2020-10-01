using Toybox.Graphics;
using Toybox.StringUtil;
using Toybox.System;
using Toybox.Weather;
using Toybox.WatchUi as Ui;

class Weather extends Ui.Drawable {

	function initialize() {
		Drawable.initialize({ :identifier => "Weather" });
	}
	
	function draw(dc) {
		if (Weather.getCurrentConditions() == null) {
			drawUnavailableWeather(dc);
			return;
		}
		
		drawCurrentTemperature(dc);
		drawLowTemperature(dc);
		drawHighTemperature(dc);
		drawPrecipitationChance(dc);
		drawWeatherCondition(dc);
		drawLocation(dc);		
	}
	
	function drawUnavailableWeather(dc) {
		var x = $.SCREEN_WIDTH / 2, y= 57;
		
		var message = Ui.loadResource(Rez.Strings.NoWeatherData);

		dc.setColor($.areaForegroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.smallFont, message, Graphics.TEXT_JUSTIFY_CENTER);	
	}
	
	function drawCurrentTemperature(dc) {
		var x = 64, y = 37;

		drawTemperature(dc, $.areaForegroundColor, x, y, Weather.getCurrentConditions().temperature);
	}
	
	function drawLowTemperature(dc) {
		var x = 116, y = 37;

		drawTemperature(dc, $.lowTemperatureColor, x, y, Weather.getCurrentConditions().lowTemperature);
	}
	
	function drawHighTemperature(dc) {
		var x = 168, y = 37;

		drawTemperature(dc, $.highTemperatureColor, x, y, Weather.getCurrentConditions().highTemperature);
	}
	
	function drawTemperature(dc, color, x, y, temperature) {	
		// Temperature
		var units = System.getDeviceSettings().temperatureUnits == System.UNIT_STATUTE ? "F" : "C";
		temperature = units.equals("F") ? temperature * 1.8 + 32 : temperature;
		temperature = temperature.format("%d");

		var temperatureWidth = dc.getTextWidthInPixels(temperature, $.smallFont);
		var degreesWidth = 4;
		var unitsWidth = dc.getTextWidthInPixels(units, $.smallFont);
		var width = temperatureWidth + 2 + degreesWidth + 2 + unitsWidth;

		x = x - width / 2;

		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.smallFont, temperature, Graphics.TEXT_JUSTIFY_LEFT);
				
		// Degree glyph (not available in any font under resources/fonts)
		x = x + temperatureWidth + 2;

		dc.setPenWidth(1);
		dc.drawRectangle(x, y + 4, degreesWidth, degreesWidth);
		
		// Units
		x = x + degreesWidth + 2;

		dc.drawText(x, y, $.smallFont, units, Graphics.TEXT_JUSTIFY_LEFT);
	}
	
	function drawPrecipitationChance(dc) {
		var x = 220, y = 37;
		
		// Precipitation chance
		var precipitationChance = Weather.getCurrentConditions().precipitationChance;			
		precipitationChance = precipitationChance.format("%d");
	
		var chanceWidth = dc.getTextWidthInPixels(precipitationChance, $.smallFont);
		var percentageWidth = 14;
		var width = chanceWidth + 2 + percentageWidth;
		
		x = x - width / 2;

		dc.setColor($.areaForegroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.smallFont, precipitationChance, Graphics.TEXT_JUSTIFY_LEFT);

		// Percentage glyph (not available in any font under resources/fonts)
		x = x + chanceWidth + 2;
		
		dc.drawRectangle(x, y + 4, 4, 4);
		dc.drawLine(x + 7, y + 4, x + 2, y + 15);
		dc.drawRectangle(x + 6, y + 12, 4, 4);
	}

	function drawWeatherCondition(dc) {
		var x = $.SCREEN_WIDTH / 2, y = 57;
		
		var condition = Weather.getCurrentConditions().condition;		
		condition = Ui.loadResource($.CONDITIONS[condition]);

		dc.setColor($.areaForegroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.smallFont, condition, Graphics.TEXT_JUSTIFY_CENTER);	
	}
		
	function drawLocation(dc) {
		var x = $.SCREEN_WIDTH / 2, y = 76;

		// Draw location name e.g. "Leganés, España" will look like "LEGANES".
		// As the font by default doesn't support Spanish accents, I've modified the
		// .fnt file so e.g. 'Á' (193) points to the same bitmap as 'A' (65).
		var observationLocationName = Weather.getCurrentConditions().observationLocationName;		
		observationLocationName = observationLocationName == null ? "--------" : observationLocationName;
		var comma = observationLocationName.find(",");
		observationLocationName = observationLocationName.substring(0, comma == null || comma > 12 ? 12 : comma);

		dc.setColor($.areaForegroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.smallFont, observationLocationName, Graphics.TEXT_JUSTIFY_CENTER);			
	}
}