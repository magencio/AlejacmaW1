using Toybox.WatchUi as Ui;

class Calories extends Ui.Drawable {
	hidden var _foregroundColor;
	hidden var _screenWidth, _screenHeight;
	hidden var _caloriesFont, _unitsFont, _iconFont;
	
	const ICON_CALORIES = 88.toChar(); // 'X'
	
	function initialize() {
		Drawable.initialize({ :identifier => "Calories" });
		
		_foregroundColor = Application.getApp().getProperty("ForegroundColor");
		
		_screenWidth = System.getDeviceSettings().screenWidth;
		_screenHeight = System.getDeviceSettings().screenHeight;
		
		_caloriesFont = Ui.loadResource(Rez.Fonts.Tech24Font);
		_unitsFont = Ui.loadResource(Rez.Fonts.Tech16Font);
		_iconFont = Ui.loadResource(Rez.Fonts.IconsFont);
	}
	
	function draw(dc) {
		drawCalories(dc);
		drawIcon(dc);
		drawUnits(dc);
	}
	
	function drawCalories(dc) {
		var x = _screenWidth / 2, y = _screenHeight - 26;
		
		var calories = ActivityMonitor.getInfo().calories;
		calories = calories > 99999 ? 99999 : calories;  
		calories = calories.format("%04d");
		
		dc.setColor(_foregroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, _caloriesFont, calories, Graphics.TEXT_JUSTIFY_CENTER);
	}
	
	function drawIcon(dc) {
		var x = _screenWidth / 2 - 34, y = _screenHeight - 27;
		
		dc.setColor(_foregroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, _iconFont, ICON_CALORIES, Graphics.TEXT_JUSTIFY_CENTER);			
	}
	
	function drawUnits(dc) {
		var x = _screenWidth / 2 + 45, y = _screenHeight - 23;
		
		dc.setColor(_foregroundColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, _unitsFont, "KC", Graphics.TEXT_JUSTIFY_RIGHT);					
	}
}