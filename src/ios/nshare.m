/********* nshare.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface nshare : CDVPlugin {
  // Member variables go here.
}

- (void)openShare:(CDVInvokedUrlCommand*)command;
@end

@implementation nshare

- (void)openShare:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0]; 
    
    //分享的标题 
    NSString *textToShare = @"分享的标题。"; 
    //分享的图片 
    UIImage *imageToShare = [UIImage imageNamed:@"312.jpg"]; 
    //分享的url 
    NSURL *urlToShare = [NSURL URLWithString:@"http://www.baidu.com"]; 
    //在这里呢 如果想分享图片 就把图片添加进去  文字什么的通上 
    NSArray *activityItems = @[textToShare,imageToShare, urlToShare]; 
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil]; 
    //不出现在活动项目 
    activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll]; 
    [self presentViewController:activityVC animated:YES completion:nil]; 
    // 分享之后的回调 
    activityVC.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
    	if (completed) {
    		NSLog(@"completed"); 
    		//分享 成功 
    	} else  {
    		NSLog(@"cancled"); 
    		//分享 取消 
    	} 
    }; 
}

@end
