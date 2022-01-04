//
//  SBBackWebViewController.m
//  BaseProject
//
//  Created by Jivan on 2021/8/23.
//

#import "SBBackWebViewController.h"

@interface SBBackWebViewController ()<UIGestureRecognizerDelegate,WKNavigationDelegate>

@property (nonatomic,strong) UIBarButtonItem *closeBarButton;
@property (nonatomic,strong) UIBarButtonItem *backBarButton;
@property (nonatomic,assign) BOOL isPresent;
@property (nonatomic,weak) id <UIGestureRecognizerDelegate> originalGestureDelegate;

@end

@implementation SBBackWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView.navigationDelegate = self;
    _isPresent = (self.presentingViewController != nil);
    if (_isPresent) {
        self.navigationItem.leftBarButtonItems = @[self.closeBarButton];
    }else{
        self.navigationItem.leftBarButtonItems = @[self.backBarButton];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _originalGestureDelegate = self. navigationController.interactivePopGestureRecognizer.delegate;
    self.navigationController.interactivePopGestureRecognizer.delegate = self ;
 
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = _originalGestureDelegate ;
}
#pragma mark - Event

- (void)handleClose {
    if (_isPresent) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)handleBack {
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }else{
        [self handleClose];
    }
}
#pragma mark - WKNavigationDelegate
-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
    [self updateBackButtonsWithNavigationAction:navigationAction];
}
- (void)updateBackButtonsWithNavigationAction:(WKNavigationAction *)navigationAction{
    switch (navigationAction.navigationType) {
        case WKNavigationTypeBackForward:
        {
            if (_isPresent && !self.webView.canGoBack) {
                self.navigationItem.leftBarButtonItems = @[self.closeBarButton];
            }else{
                if (self.navigationItem.leftBarButtonItems.count != 2) {
                    self.navigationItem.leftBarButtonItems = @[self.backBarButton, self.closeBarButton];
                }
            }
        }
            break;
            
        default:
            break;
    }
}
#pragma mark - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer{
    if ([gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]] && !self.webView.canGoBack) {
        return YES;
    }
    
    return  NO;
}
#pragma mark - getter

- (UIBarButtonItem *)closeBarButton{
    if (!_closeBarButton) {
        UIButton *closeButton = UIButton
        .sb_new
        .sb_normalTitle(@"关闭")
        .sb_font([UIFont systemFontOfSize:15])
        .sb_normalTitleColor(UIColor.systemBlueColor)
        .sb_selectTitleColor(UIColor.systemBlueColor);
        [closeButton sizeToFit];
        [closeButton addTarget:self action:@selector(handleClose) forControlEvents:UIControlEventTouchUpInside];
        _closeBarButton = [[UIBarButtonItem alloc]initWithCustomView:closeButton];
      
    }
    return _closeBarButton;
}

- (UIBarButtonItem *)backBarButton{
    if (!_backBarButton) {
        UIButton *backButton = UIButton
        .sb_new
        .sb_normalTitle(@"返回")
        .sb_font([UIFont systemFontOfSize:15])
        .sb_normalTitleColor(UIColor.systemBlueColor)
        .sb_selectTitleColor(UIColor.systemBlueColor);
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(handleBack) forControlEvents:UIControlEventTouchUpInside];
        _backBarButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    }
    return _backBarButton;
}


@end
