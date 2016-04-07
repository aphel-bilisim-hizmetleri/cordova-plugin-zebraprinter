#import "ZebraPrinterPlugin.h"
#import "ZebraPrinterConnection.h"
#import "ZebraPrinter.h"
#import "ZebraPrinterFactory.h"
#import "TcpPrinterConnection.h"
#import "MFiBtPrinterConnection.h"

@implementation ZebraPrinterPlugin

- (void)print:(CDVInvokedUrlCommand*)command
{

    NSString* content = [[command arguments] objectAtIndex:0];

    NSError *error = nil;

    id<ZebraPrinterConnection, NSObject> connection = nil;

    NSString *ipAddress = @"192.168.0.1";
    int port = 6101;

    connection = [[TcpPrinterConnection alloc] initWithAddress:ipAddress andWithPort:port];

    [connection open];

    id<ZebraPrinter,NSObject> printer = [ZebraPrinterFactory getInstance:connection error:&error];

    PrinterLanguage language = [printer getPrinterControlLanguage];

    BOOL sentOK = [self printTestLabel:language onConnection:connection withError:&error labelContent:content];

    NSString* msg;

    if (sentOK == YES) {

        msg = @"OK";
    }
    else{

        msg = @"ERROR";
    }

    NSString* callbackId = [command callbackId];

    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:msg];

    [self.commandDelegate sendPluginResult:result callbackId:callbackId];
}

-(BOOL)printTestLabel:(PrinterLanguage) language onConnection:(id<ZebraPrinterConnection, NSObject>)connection withError:(NSError**)error labelContent:(NSString*) labelContent {

    NSData *data = [NSData dataWithBytes:[labelContent UTF8String] length:[labelContent length]];

    [connection write:data error:error];

	if(*error == nil){

		return YES;
	} else {

		return NO;
	}
}

@end