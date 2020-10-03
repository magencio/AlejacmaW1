using Toybox.Application;

var colorBackground;
var colorAreaBorder;
var colorAreaBackground;
var colorOrnaments;
var colorSteps;
var colorStepsLine;
var colorStepsGoal;
var colorStepsHistoryBar;
var colorStepsHistoryDay;
var colorTemperatureCurrent;
var colorTemperatureLow;
var colorTemperatureHigh;
var colorPrecipitationChance;
var colorWeatherCondition;
var colorLocation;
var colorConnectionsActive;
var colorConnectionsInactive;
var colorBattery;
var colorBatteryPercentage;
var colorBatteryCharging;
var colorHeartRate;
var colorHeartRateTitle;
var colorMoveBarActive;
var colorMoveBarInactive;
var colorDate;
var colorTime;
var colorTimeAmPm;
var colorAlarmActive;
var colorAlarmInactive;
var colorNotificationsActive;
var colorNotificationsInactive;
var colorCalories;
var colorCaloriesLine;

function updateSettings() {
    $.colorBackground = Application.getApp().getProperty("ColorBackground");
    $.colorAreaBorder = Application.getApp().getProperty("ColorAreaBorder");
	$.colorAreaBackground = Application.getApp().getProperty("ColorAreaBackground");
    $.colorOrnaments = Application.getApp().getProperty("ColorOrnaments");	
    $.colorSteps = Application.getApp().getProperty("ColorSteps");
    $.colorStepsLine = Application.getApp().getProperty("ColorStepsLine");
	$.colorStepsGoal = Application.getApp().getProperty("ColorStepsGoal");
	$.colorStepsHistoryBar = Application.getApp().getProperty("ColorStepsHistoryBar");		
	$.colorStepsHistoryDay = Application.getApp().getProperty("ColorStepsHistoryDay");		
	$.colorTemperatureCurrent = Application.getApp().getProperty("ColorTemperatureCurrent");
	$.colorTemperatureLow = Application.getApp().getProperty("ColorTemperatureLow");
	$.colorTemperatureHigh = Application.getApp().getProperty("ColorTemperatureHigh");
	$.colorPrecipitationChance = Application.getApp().getProperty("ColorPrecipitationChance");
	$.colorWeatherCondition = Application.getApp().getProperty("ColorWeatherCondition");
	$.colorLocation = Application.getApp().getProperty("ColorLocation");
    $.colorConnectionsActive = Application.getApp().getProperty("ColorConnectionsActive");
    $.colorConnectionsInactive = Application.getApp().getProperty("ColorConnectionsInactive");	
	$.colorBattery = Application.getApp().getProperty("ColorBattery");
	$.colorBatteryPercentage = Application.getApp().getProperty("ColorBatteryPercentage");
	$.colorBatteryCharging = Application.getApp().getProperty("ColorBatteryCharging");
	$.colorHeartRate = Application.getApp().getProperty("ColorHeartRate");
	$.colorHeartRateTitle = Application.getApp().getProperty("ColorHeartRateTitle");	
	$.colorMoveBarActive = Application.getApp().getProperty("ColorMoveBarActive");
	$.colorMoveBarInactive = Application.getApp().getProperty("ColorMoveBarInactive");
	$.colorDate = Application.getApp().getProperty("ColorDate");   
	$.colorTime = Application.getApp().getProperty("ColorTime");   
	$.colorTimeAmPm = Application.getApp().getProperty("ColorTimeAmPm");   
	$.colorAlarmActive = Application.getApp().getProperty("ColorAlarmActive");   
	$.colorAlarmInactive = Application.getApp().getProperty("ColorAlarmInactive");   
    $.colorNotificationsActive = Application.getApp().getProperty("ColorNotificationsActive");
    $.colorNotificationsInactive = Application.getApp().getProperty("ColorNotificationsInactive");	
    $.colorCalories = Application.getApp().getProperty("ColorCalories");
    $.colorCaloriesLine = Application.getApp().getProperty("ColorCaloriesLine");    
}
