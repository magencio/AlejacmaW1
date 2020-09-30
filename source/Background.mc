using Toybox.Application;
using Toybox.Graphics;
using Toybox.WatchUi;

class Background extends WatchUi.Drawable {
	hidden var _backgroundColor, _areaBackgroundColor, _areaBorderColor, _lineColor, _ornamentColor;
	hidden var _screenHeight, _screenWidth;
	
	const BORDER = 2;
	
    function initialize() {
        Drawable.initialize({ :identifier => "Background" });
        
        _backgroundColor = Application.getApp().getProperty("BackgroundColor");
        _areaBackgroundColor = Application.getApp().getProperty("AreaBackgroundColor");
        _areaBorderColor = Application.getApp().getProperty("AreaBorderColor");
        _lineColor = Application.getApp().getProperty("LineColor");
        _ornamentColor = Application.getApp().getProperty("OrnamentColor");
        
		_screenHeight = System.getDeviceSettings().screenHeight;
		_screenWidth = System.getDeviceSettings().screenWidth;
    }

    function draw(dc) {
		drawBackground(dc); 
		drawStepsLine(dc);
		drawWeatherArea(dc);       
        drawTopOrnament(dc);
        drawHeartRateArea(dc);
        drawStepsHistoryArea(dc);
        drawBottomOrnament(dc);
        drawDateTimeArea(dc);
        drawCaloriesLine(dc);
    }
    
    function drawBackground(dc) {
        dc.setColor(Graphics.COLOR_TRANSPARENT, _backgroundColor);
        dc.clear();
    }
    
    function drawStepsLine(dc) {
		var x = 0, y = 30;
		
		dc.setColor(_lineColor, Graphics.COLOR_TRANSPARENT);
		dc.setPenWidth(2);
		dc.drawLine(x, y, x + _screenWidth, y);    
    }
    
    function drawWeatherArea(dc) {
		var x = 0, y = 35, height = 64;
		
		dc.setColor(_areaBorderColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y],
			[x + _screenWidth, y],
			[x + _screenWidth, y + height - 22],
			[x + _screenWidth - 46, y + height - 22],
			[x + _screenWidth - 50, y + height - 18],
			[x + _screenWidth - 50, y + height - 5],
			[x + _screenWidth - 54, y + height - 1],
			[x + 112, y + height - 1],
			[x + 82, y + height - 26],
			[x + 0, y + height - 26]]);
	
		dc.setColor(_areaBackgroundColor, Graphics.COLOR_TRANSPARENT);		
		dc.fillPolygon([
			[x, y + BORDER],
			[x + _screenWidth, y + BORDER],
			[x + _screenWidth, y + height - BORDER - 22],
			[x + _screenWidth - BORDER - 46, y + height - BORDER - 22],
			[x + _screenWidth - BORDER - 50, y + height - BORDER - 18],
			[x + _screenWidth - BORDER - 50, y + height - BORDER - 5],
			[x + _screenWidth - BORDER - 54, y + height - BORDER - 1],
			[x + 115 - BORDER, y + height - BORDER - 1],
			[x + 85 - BORDER, y + height - BORDER - 26],
			[x, y + height - BORDER - 26]]);
	}
    
    function drawTopOrnament(dc) {				
		var x = 0, y = _screenHeight / 2 - 62;

		dc.setColor(_ornamentColor, Graphics.COLOR_TRANSPARENT);		
		dc.fillPolygon([
			[x + 75, y],
			[x + 80, y],
			[x + 111, y + 25],
			[x + _screenWidth, y + 25],
			[x + _screenWidth, y + 28],
			[x + 109, y + 28]]);
		dc.fillPolygon([
			[x + 67, y],
			[x + 72, y],
			[x + 85, y + 10],
			[x + 80, y + 10]]);
		dc.fillPolygon([
			[x + 57, y],
			[x + 64, y],
			[x + 77, y + 10],
			[x + 70, y + 10]]);
		dc.fillPolygon([
			[x + 45, y],
			[x + 54, y],
			[x + 67, y + 10],
			[x + 58, y + 10]]);
		dc.fillPolygon([
			[x + 28, y],
			[x + 42, y],
			[x + 55, y + 10],
			[x + 41, y + 10]]);
		dc.fillPolygon([
			[x, y],
			[x + 25, y],
			[x + 38, y + 10],
			[x, y + 10]]);
    }
    
    function drawHeartRateArea(dc) {
		var x = 0, y = 95, width = 104, height = 87;
    
		dc.setColor(_areaBorderColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y],
			[x + width - 18, y],
			[x + width - 1, y + 14],
			[x + width - 1, y + height - 15],
			[x + width - 18, y + height - 1],
			[x, y + height - 1]
		]);
	
		dc.setColor(_areaBackgroundColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y + BORDER],
			[x + width - BORDER - 18, y + BORDER],
			[x + width - BORDER - 1, y + BORDER + 14],
			[x + width - BORDER - 1, y + height - BORDER - 14],
			[x + width - BORDER - 17, y + height - BORDER - 1],
			[x, y + height - BORDER - 1]
		]);    
    }
    
    function drawStepsHistoryArea(dc) {
		var x = 110, y = 112, height = 39;
		        
    	dc.setColor(_areaBorderColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y + 5],
			[x + 5, y],
			[_screenWidth, y],
			[_screenWidth, y + height - 1],
			[x + 2, y + height - 1],
			[x, y + height - 3]]);
	
		dc.setColor(_areaBackgroundColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x + BORDER, y + BORDER + 4],
			[x + BORDER + 4, y + BORDER],
			[_screenWidth, y + BORDER],
			[_screenWidth, y + height - BORDER - 1],
			[x + BORDER + 1, y + height - BORDER - 1],
			[x + BORDER, y + height - BORDER - 2]]);
    }
    
    function drawBottomOrnament(dc) {
		var x = 0, y = _screenHeight / 2 + 58;

		dc.setColor(_ornamentColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x + 75, y],
			[x + 80, y],
			[x + 111, y - 25],
			[x + _screenWidth, y - 25],
			[x + _screenWidth, y - 28],
			[x + 109, y - 28]]);
		dc.fillPolygon([
			[x + 67, y],
			[x + 72, y],
			[x + 85, y - 10],
			[x + 80, y - 10]]);
		dc.fillPolygon([
			[x + 57, y],
			[x + 64, y],
			[x + 77, y - 10],
			[x + 70, y - 10]]);
		dc.fillPolygon([
			[x + 45, y],
			[x + 54, y],
			[x + 67, y - 10],
			[x + 58, y - 10]]);
		dc.fillPolygon([
			[x + 28, y],
			[x + 42, y],
			[x + 55, y - 10],
			[x + 41, y - 10]]);
		dc.fillPolygon([
			[x, y],
			[x + 25, y],
			[x + 38, y - 10],
			[x, y - 10]]);
    }
    
    function drawDateTimeArea(dc) {
		var x = 0, y = 178, height = 70;

		dc.setColor(_areaBorderColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y + 25],
			[x + 82, y + 25],
			[x + 112, y],
			[x + _screenWidth - 38, y],
			[x + _screenWidth - 34, y + 4],
			[x + _screenWidth - 34, y + height - 1],
			[x + 90, y + height - 1],
			[x + 86, y + height - 5],
			[x + 86, y + height - 16],
			[x + 82, y + height - 20],
			[x + 0, y + height - 20]]);
		
		dc.setColor(_areaBackgroundColor, Graphics.COLOR_TRANSPARENT);		
		dc.fillPolygon([
			[x, y + 25 + BORDER],
			[x + 83, y + 25 + BORDER],
			[x + 113, y + BORDER],
			[x + _screenWidth - BORDER - 38, y + BORDER],
			[x + _screenWidth - BORDER - 34, y + BORDER + 4],
			[x + _screenWidth - BORDER - 34, y + height - BORDER - 1],
			[x + 91, y + height - BORDER - 1],
			[x + 86 + BORDER, y + height - BORDER - 4],
			[x + 86 + BORDER, y + height - BORDER - 15],
			[x + 83, y + height - BORDER - 20],
			[x, y + height - BORDER - 20]]);        
    }
    
    function drawCaloriesLine(dc) {
		var x = 0, y = _screenHeight - 29;

		dc.setColor(_lineColor, Graphics.COLOR_TRANSPARENT);
		dc.setPenWidth(2);
		dc.drawLine(x, y, x + _screenWidth, y);    
    }
}
