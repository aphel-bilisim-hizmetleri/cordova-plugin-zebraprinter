package tr.com.aphel.cordova.plugin;

import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;

public class ZebraPrinterPlugin extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {

        if (action.equals("print")) {

            String content = data.getString(0);
            String message = "Hello, " + content;
            callbackContext.success(message);

            return true;

        } else {
            
            return false;
        }
    }
}
