using Toybox.Application;
using Toybox.Graphics;
using Toybox.WatchUi;

class Background extends WatchUi.Drawable {

    function initialize() {
        Drawable.initialize({ :identifier => "Background" });
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
        dc.setColor(Graphics.COLOR_TRANSPARENT, $.colorBackground);
        dc.clear();
    }
    
    function drawStepsLine(dc) {
		var x = 0, y = 30;
		
		dc.setColor($.colorStepsLine, Graphics.COLOR_TRANSPARENT);
		dc.setPenWidth(2);
		dc.drawLine(x, y, x + $.SCREEN_WIDTH, y);    
    }
    
    function drawWeatherArea(dc) {
		var x = 0, y = 35;
		
		dc.setColor($.colorAreaBorder, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y],
			[x + $.SCREEN_WIDTH, y],
			[x + $.SCREEN_WIDTH, y + 44],
			[x + $.SCREEN_WIDTH - 45, y + 44],
			[x + $.SCREEN_WIDTH - 48, y + 47],
			[x + $.SCREEN_WIDTH - 48, y + 59],
			[x + $.SCREEN_WIDTH - 52, y + 63],
			[x + 98, y + 63],			
			[x + 79, y + 44],
			[x, y + 44]]);
	
		dc.setColor($.colorAreaBackground, Graphics.COLOR_TRANSPARENT);		
		dc.fillPolygon([
			[x, y + $.BORDER],
			[x + $.SCREEN_WIDTH, y + $.BORDER],
			[x + $.SCREEN_WIDTH, y - $.BORDER + 44],
			[x + $.SCREEN_WIDTH - $.BORDER - 44, y - $.BORDER + 44],
			[x + $.SCREEN_WIDTH - $.BORDER - 48, y - $.BORDER + 48],
			[x + $.SCREEN_WIDTH - $.BORDER - 48, y - $.BORDER + 60],
			[x + $.SCREEN_WIDTH - $.BORDER - 51, y - $.BORDER + 63],
			[x + $.BORDER + 97, y - $.BORDER + 63],
			[x + $.BORDER + 78, y - $.BORDER + 44],
			[x, y - $.BORDER + 44]]);
	}
    
    function drawTopOrnament(dc) {				
		var x = 0, y = $.SCREEN_HEIGHT / 2 - 37;

		dc.setColor($.colorOrnaments, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x + 84, y],
			[x + $.SCREEN_WIDTH, y],
			[x + $.SCREEN_WIDTH, y + 3],
			[x + 87, y + 3]]);
		dc.fillPolygon([
			[x + 76, y],
			[x + 81, y],
			[x + 85, y + 3],
			[x + 79, y + 3]]);
		dc.fillPolygon([
			[x + 66, y],
			[x + 73, y],
			[x + 77, y + 3],
			[x + 69, y + 3]]);
		dc.fillPolygon([
			[x + 54, y],
			[x + 63, y],
			[x + 67, y + 3],
			[x + 57, y + 3]]);
		dc.fillPolygon([
			[x + 37, y],
			[x + 51, y],
			[x + 55, y + 3],
			[x + 40, y + 3]]);
		dc.fillPolygon([
			[x, y],
			[x + 34, y],
			[x + 38, y + 3],
			[x, y + 3]]);
    }
    
    function drawHeartRateArea(dc) {
		var x = 0, y = 112;
    
		dc.setColor($.colorAreaBorder, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y],
			[x + 98, y],
			[x + 103, y + 5],
			[x + 103, y + 50],
			[x + 98, y + 55],
			[x, y + 55]
		]);
	
		dc.setColor($.colorAreaBackground, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y + $.BORDER],
			[x - $.BORDER + 99, y + $.BORDER],
			[x - $.BORDER + 103, y + $.BORDER + 4],
			[x - $.BORDER + 103, y - $.BORDER + 51],
			[x - $.BORDER + 99, y - $.BORDER + 55],
			[x, y - $.BORDER + 55]
		]);      
    }
    
    function drawStepsHistoryArea(dc) {
		var x = 110, y = 112;
		        
    	dc.setColor($.colorAreaBorder, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y + 5],
			[x + 5, y],
			[$.SCREEN_WIDTH, y],
			[$.SCREEN_WIDTH, y + 38],
			[x + 2, y + 38],
			[x, y + 36]]);
	
		dc.setColor($.colorAreaBackground, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x + $.BORDER, y + $.BORDER + 4],
			[x + $.BORDER + 4, y + $.BORDER],
			[$.SCREEN_WIDTH, y + $.BORDER],
			[$.SCREEN_WIDTH, y - $.BORDER + 38],
			[x + $.BORDER + 1, y - $.BORDER + 38],
			[x + $.BORDER, y - $.BORDER + 38]]);
    }
    
    function drawBottomOrnament(dc) {
		var x = 0, y = $.SCREEN_HEIGHT / 2 + 58;

		dc.setColor($.colorOrnaments, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x + 75, y],
			[x + 80, y],
			[x + 111, y - 25],
			[x + $.SCREEN_WIDTH, y - 25],
			[x + $.SCREEN_WIDTH, y - 28],
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
		var x = 0, y = 178;

		dc.setColor($.colorAreaBorder, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y + 25],
			[x + 82, y + 25],
			[x + 112, y],
			[x + $.SCREEN_WIDTH, y],
			[x + $.SCREEN_WIDTH, y + 69],
			[x + 101, y + 69],
			[x + 82, y + 50],
			[x, y + 50]]);
		
		dc.setColor($.colorAreaBackground, Graphics.COLOR_TRANSPARENT);		
		dc.fillPolygon([
			[x, y + $.BORDER + 25],
			[x + 83, y + $.BORDER + 25],
			[x + 113, y + $.BORDER],
			[x + $.SCREEN_WIDTH, y + $.BORDER],
			[x + $.SCREEN_WIDTH, y - $.BORDER + 69],
			[x + 102, y - $.BORDER + 69],
			[x + 83, y - $.BORDER + 50],
			[x, y - $.BORDER + 50]]);        
    }
    
    function drawCaloriesLine(dc) {
		var x = 0, y = $.SCREEN_HEIGHT - 29;

		dc.setColor($.colorCaloriesLine, Graphics.COLOR_TRANSPARENT);
		dc.setPenWidth(2);
		dc.drawLine(x, y, x + $.SCREEN_WIDTH, y);    
    }
}
