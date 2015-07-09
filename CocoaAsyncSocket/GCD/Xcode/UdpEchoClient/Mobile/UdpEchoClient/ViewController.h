#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
{
	IBOutlet UITextField *addrField;
	IBOutlet UITextField *portField;
	IBOutlet UITextField *messageField;
	IBOutlet UIWebView *webView;
}
+ (NSString *)hexStringFromString:(NSString *)string;
-(NSData *)hexToByteToNSData:(NSString *)str;

- (IBAction)send:(id)sender;

@end
