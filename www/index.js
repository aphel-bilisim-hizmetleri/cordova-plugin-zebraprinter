/*global cordova, module*/

module.exports = {
    print: function (content, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "ZebraPrinterPlugin", "print", [content]);
    }
};
