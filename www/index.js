module.exports = {
    print: function (content, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "CordovaZebraPrinterPlugin", "print", [content]);
    }
};