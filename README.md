# Cordova Zebra Bluetooth Printer Plugin

Cordova/Phonegap plugin for Zebra bluetooth/wireless printers


## Installation

Install the plugin

    $ cordova plugin add https://github.com/aphel-bilisim-hizmetleri/cordova-plugin-zebraprinter --save
    

## Using


```js
        var success = function () {

            alert("Operation completed");
        };

        var failure = function () {

            alert("Error calling Zebra Printer Plugin");
        };

        zebraprinter.print("Text Content", success, failure);
```

