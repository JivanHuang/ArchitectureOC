//
//  SBWebViewController.h
//  BaseProject
//
//  Created by Jivan on 2021/8/23.
//

#import "SBViewController.h"
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBWebViewController : SBViewController

@property (nonatomic,strong) NSURL *URL;
@property (nonatomic,copy) NSString *HTMLString;
@property (nonatomic,strong,readonly) WKWebView *webView;

@end

NS_ASSUME_NONNULL_END
