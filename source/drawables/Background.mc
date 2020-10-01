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
        dc.setColor(Graphics.COLOR_TRANSPARENT, $.backgroundColor);
        dc.clear();
    }
    
    function drawStepsLine(dc) {
		var x = 0, y = 30;
		
		dc.setColor($.lineColor, Graphics.COLOR_TRANSPARENT);
		dc.setPenWidth(2);
		dc.drawLine(x, y, x + $.SCREEN_WIDTH, y);    
    }
    
    function drawWeatherArea(dc) {
		var x = 0, y = 35;
		
		dc.setColor($.areaBorderColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y],
			[x + $.SCREEN_WIDTH, y],
			[x + $.SCREEN_WIDTH, y + 43],
			[x + $.SCREEN_WIDTH - 47, y + 43],
			[x + $.SCREEN_WIDTH - 50, y + 46],
			[x + $.SCREEN_WIDTH - 50, y + 59],
			[x + $.SCREEN_WIDTH - 54, y + 63],
			[x + 112, y + 63],
			[x + 82, y + 37],
			[x + 82, y + 26],
			[x + 79, y + 23],
			[x + 0, y + 23]]);
	
		dc.setColor($.areaBackgroundColor, Graphics.COLOR_TRANSPARENT);		
		
		dc.fillPolygon([
			[x, y + $.BORDER],
			[x + $.SCREEN_WIDTH, y + $.BORDER],
			[x + $.SCREEN_WIDTH, y + 43 - $.BORDER ],
			[x + $.SCREEN_WIDTH - $.BORDER - 46, y + 43 - $.BORDER],
			[x + $.SCREEN_WIDTH - $.BORDER - 50, y + 47 - $.BORDER],
			[x + $.SCREEN_WIDTH - $.BORDER - 50, y + 60 - $.BORDER],
			[x + $.SCREEN_WIDTH - $.BORDER - 53, y + 63 - $.BORDER],
			[x + 115 - $.BORDER, y + 63 - $.BORDER],
			[x + 86 - $.BORDER, y + 38 - $.BORDER],
			[x + 86 - $.BORDER, y + 27 - $.BORDER],
			[x + 82 - $.BORDER, y + 23 - $.BORDER],
			[x, y + 23 - $.BORDER]]);
	}
    
    function drawTopOrnament(dc) {				
		var x = 0, y = $.SCREEN_HEIGHT / 2 - 62;

		dc.setColor($.ornamentColor, Graphics.COLOR_TRANSPARENT);		
		dc.fillPolygon([
			[x + 75, y],
			[x + 80, y],
			[x + 111, y + 25],
			[x + $.SCREEN_WIDTH, y + 25],
			[x + $.SCREEN_WIDTH, y + 28],
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
		var x = 0, y = 95, width = 104;
    
		dc.setColor($.areaBorderColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y],
			[x + width - 18, y],
			[x + width - 1, y + 14],
			[x + width - 1, y + 72],
			[x + width - 18, y + 86],
			[x, y + 86]
		]);
	
		dc.setColor($.areaBackgroundColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y + $.BORDER],
			[x + width - $.BORDER - 17, y + $.BORDER],
			[x + width - $.BORDER - 1, y + $.BORDER + 13],
			[x + width - $.BORDER - 1, y + 73 - $.BORDER],
			[x + width - $.BORDER - 17, y + 86 - $.BORDER],
			[x, y + 86 - $.BORDER]
		]);    
    }
    
    function drawStepsHistoryArea(dc) {
		var x = 110, y = 112;
		        
    	dc.setColor($.areaBorderColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y + 5],
			[x + 5, y],
			[$.SCREEN_WIDTH, y],
			[$.SCREEN_WIDTH, y + 38],
			[x + 2, y + 38],
			[x, y + 36]]);
	
		dc.setColor($.areaBackgroundColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x + $.BORDER, y + $.BORDER + 4],
			[x + $.BORDER + 4, y + $.BORDER],
			[$.SCREEN_WIDTH, y + $.BORDER],
			[$.SCREEN_WIDTH, y + 38 - $.BORDER],
			[x + $.BORDER + 1, y + 38 - $.BORDER],
			[x + $.BORDER, y + 38 - $.BORDER]]);
    }
    
    function drawBottomOrnament(dc) {
		var x = 0, y = $.SCREEN_HEIGHT / 2 + 58;

		dc.setColor($.ornamentColor, Graphics.COLOR_TRANSPARENT);
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

		dc.setColor($.areaBorderColor, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x, y + 25],
			[x + 82, y + 25],
			[x + 112, y],
			[x + $.SCREEN_WIDTH - 38, y],
			[x + $.SCREEN_WIDTH - 34, y + 4],
			[x + $.SCREEN_WIDTH - 34, y + 69],
			[x + 90, y + 69],
			[x + 86, y + 65],
			[x + 86, y + 54],
			[x + 82, y + 50],
			[x + 0, y + 50]]);
		
		dc.setColor($.areaBackgroundColor, Graphics.COLOR_TRANSPARENT);		
		dc.fillPolygon([
			[x, y + 25 + $.BORDER],
			[x + 83, y + 25 + $.BORDER],
			[x + 113, y + $.BORDER],
			[x + $.SCREEN_WIDTH - $.BORDER - 37, y + $.BORDER],
			[x + $.SCREEN_WIDTH - $.BORDER - 34, y + $.BORDER + 3],
			[x + $.SCREEN_WIDTH - $.BORDER - 34, y + 69 - $.BORDER],
			[x + 91, y + 69 - $.BORDER],
			[x + 86 + $.BORDER, y + 66 - $.BORDER],
			[x + 86 + $.BORDER, y + 55 - $.BORDER],
			[x + 83, y + 50 - $.BORDER],
			[x, y + 50 - $.BORDER]]);        
    }
    
    function drawCaloriesLine(dc) {
		var x = 0, y = $.SCREEN_HEIGHT - 29;

		dc.setColor($.lineColor, Graphics.COLOR_TRANSPARENT);
		dc.setPenWidth(2);
		dc.drawLine(x, y, x + $.SCREEN_WIDTH, y);    
    }
}
