using Toybox.Application;

var backgroundColor;
var foregroundColor;
var disabledColor;
var lineColor;
var ornamentColor;
var areaBorderColor;
var areaBackgroundColor;
var areaForegroundColor;
var areaDisabledColor;
var lowTemperatureColor;
var highTemperatureColor;
var stepsGoalColor;
var stepsBarColor;
var batteryChargingColor;
var heartRateColor;
var amPmColor;

function updateSettings() {
    $.backgroundColor = Application.getApp().getProperty("BackgroundColor");
    $.foregroundColor = Application.getApp().getProperty("ForegroundColor");
    $.disabledColor = Application.getApp().getProperty("DisabledColor");	
    $.lineColor = Application.getApp().getProperty("LineColor");
    $.ornamentColor = Application.getApp().getProperty("OrnamentColor");
    $.areaBorderColor = Application.getApp().getProperty("AreaBorderColor");
	$.areaBackgroundColor = Application.getApp().getProperty("AreaBackgroundColor");
	$.areaForegroundColor = Application.getApp().getProperty("AreaForegroundColor");
	$.areaDisabledColor = Application.getApp().getProperty("AreaDisabledColor");
	$.lowTemperatureColor = Application.getApp().getProperty("LowTemperatureColor");
	$.highTemperatureColor = Application.getApp().getProperty("HighTemperatureColor");
	$.stepsGoalColor = Application.getApp().getProperty("StepsGoalColor");
	$.stepsBarColor = Application.getApp().getProperty("StepsBarColor");		
	$.batteryChargingColor = Application.getApp().getProperty("BatteryChargingColor");
	$.heartRateColor = Application.getApp().getProperty("HeartRateColor");
	$.amPmColor = Application.getApp().getProperty("AmPmColor");   
}
