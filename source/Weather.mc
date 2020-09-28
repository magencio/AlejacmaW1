using Toybox.StringUtil;
using Toybox.System;
using Toybox.Weather;
using Toybox.WatchUi as Ui;

class Weather extends Ui.Drawable {
	hidden var _borderColor, _backgroundColor, _color;
	hidden var _y;
	hidden var _height;
	hidden var _border;
	
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
		
		// Draw weather condition
		dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
		var font = Ui.loadResource(Rez.Fonts.Tech18Font);
		var condition = Ui.loadResource(CONDITIONS[weather.condition]);
		dc.drawText(width / 2, _y + _border + 1, font, condition, Graphics.TEXT_JUSTIFY_CENTER);
		
		// Draw temperature
		dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
		var temperature = weather.temperature;
		var units = "C";
		if (settings.temperatureUnits == System.UNIT_STATUTE) {
			temperature = temperature * 1.8 + 32;
			units = "F";
		}
		temperature = temperature.format("%02d");
		
		var x = width / 2 + 28;
		var y = _y + height / 2 - 10;
		dc.drawText(x - 20, y, font, temperature, Graphics.TEXT_JUSTIFY_RIGHT);
		dc.setPenWidth(1);
		dc.drawRectangle(x - 17, y + 4, 4, 4);
		dc.drawText(x - 5, y, font, units, Graphics.TEXT_JUSTIFY_RIGHT);
		
		// Draw precipitation chance
		dc.drawText(x + 25, y, font, weather.precipitationChance, Graphics.TEXT_JUSTIFY_RIGHT);
		dc.drawRectangle(x + 27, y + 4, 4, 4);
		dc.drawLine(x + 34, y + 4, x + 29, y + 15);
		dc.drawRectangle(x + 33, y + 12, 4, 4);

		// Draw location name e.g. "Leganés, España" will look like "LEGANES".
		// As Tech18Font by default doesn't support Spanish accents, I've modified the
		// .fnt file so e.g. 'Á' (193) points to the same bitmap as 'A' (65).
		var observationLocationName = weather.observationLocationName ? weather.observationLocationName: "--------";
		var comma = observationLocationName.find(",");
		observationLocationName = observationLocationName.substring(0,
			comma == null || comma > 15 ? 15 : comma);
		dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
		var fontHeight = dc.getFontHeight(font);
		dc.drawText(width / 2 + 28, _y + _height - fontHeight - _border - 5, font, observationLocationName, Graphics.TEXT_JUSTIFY_CENTER);		
	}
}