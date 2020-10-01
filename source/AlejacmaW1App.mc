using Toybox.Application;
using Toybox.WatchUi;

class AlejacmaW1App extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    	$.updateSettings();
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }
    
    // Return the initial view of your application here
    function getInitialView() {
        return [ new AlejacmaW1View() ];
    }

    // New app settings have been received so trigger a UI update
    function onSettingsChanged() {
    	$.updateSettings();
        WatchUi.requestUpdate();
    }
}