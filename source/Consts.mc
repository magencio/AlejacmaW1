using Toybox.System;

// Dimensions
const SCREEN_HEIGHT = System.getDeviceSettings().screenHeight;
const SCREEN_WIDTH = System.getDeviceSettings().screenWidth;
const BORDER = 2;

// Char ids from resources/fonts/icons.fnt
const ICON_ALARM = 82.toChar(); // 'R' 
const ICON_CALORIES = 88.toChar(); // 'X'
const ICON_PHONE = 107.toChar(); // 'k'
const ICON_HEART = 109.toChar(); // 'm' 
const ICON_STEPS = 196.toChar(); // 'Ä'

// Weather conditions
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