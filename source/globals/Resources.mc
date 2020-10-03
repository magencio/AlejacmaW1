using Toybox.WatchUi as Ui;

var fontTiny, fontSmall, fontNormal, fontBig, fontLarge, fontIcons; 

function loadResources() {
	$.fontTiny = Ui.loadResource(Rez.Fonts.Tech16Font);
	$.fontSmall = Ui.loadResource(Rez.Fonts.Tech18Font);
	$.fontNormal = Ui.loadResource(Rez.Fonts.Tech24Font);
	$.fontBig = Ui.loadResource(Rez.Fonts.Tech48Font);
	$.fontLarge = Ui.loadResource(Rez.Fonts.Tech60Font);
	$.fontIcons = Ui.loadResource(Rez.Fonts.IconsFont);
}