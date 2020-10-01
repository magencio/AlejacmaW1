using Toybox.WatchUi as Ui;

var tinyFont, smallFont, normalFont, bigFont, largeFont, iconFont; 

function loadResources() {
	$.tinyFont = Ui.loadResource(Rez.Fonts.Tech16Font);
	$.smallFont = Ui.loadResource(Rez.Fonts.Tech18Font);
	$.normalFont = Ui.loadResource(Rez.Fonts.Tech24Font);
	$.bigFont = Ui.loadResource(Rez.Fonts.Tech48Font);
	$.largeFont = Ui.loadResource(Rez.Fonts.Tech60Font);
	$.iconFont = Ui.loadResource(Rez.Fonts.IconsFont);
}