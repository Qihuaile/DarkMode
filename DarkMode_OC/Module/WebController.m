//
//  WebController.m
//  DarkMode_OC
//
//  webView适配暗黑模式，
//  因为webView实际展示比较麻烦，在didfinish设置网页背景色和字体后，也会闪一下，所以用一层View盖住加载完成后稍稍延迟一下再隐藏
//  只是勉强改一下颜色。实际需要前端适配  - -。
//
//  Created by shqq on 2019/11/11.
//  Copyright © 2019 shqq. All rights reserved.
//

#import "WebController.h"
#import <WebKit/WebKit.h>

@interface WebController()<WKUIDelegate,WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIView *webMaskView;
@end

@implementation WebController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = BG_COLOR;
    
    [self.view addSubview:self.webView];
    NSString *urlString = @"https://www.baidu.com/";
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
}

- (WKWebView *)webView {
    if(!_webView) {
        WKWebViewConfiguration *configuration = [WKWebViewConfiguration new];
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds
                                      configuration:configuration];
        _webView.allowsBackForwardNavigationGestures = true;
        _webView.scrollView.showsVerticalScrollIndicator = false;
        _webView.scrollView.showsHorizontalScrollIndicator = false;
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
        
        if (@available(iOS 13.0, *)) {
            // iOS 13 webView上面盖一层webView 加载完隐藏。
            _webMaskView = [[UIView alloc] initWithFrame:_webView.bounds];
            _webMaskView.backgroundColor = WHITE_COLOR;
            [_webView addSubview:_webMaskView];
        }
    }
    
    return _webView;
}


- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    
    if (@available(iOS 13.0, *)) {
        _webMaskView.hidden = false;
        
        if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            [_webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#F8F8FF'" completionHandler:nil];
            [_webView evaluateJavaScript:@"document.body.style.backgroundColor=\"#1E1E1E\"" completionHandler:nil];
        } else {
            
            [_webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= 'unset'" completionHandler:nil];
            [_webView evaluateJavaScript:@"document.body.style.backgroundColor= 'unset'" completionHandler:nil];
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.webMaskView.hidden = true;
        });
    }
}

#pragma mark - WKUIDelegate & WKNavigationDelegate

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"--shqq  %@",webView.URL.absoluteURL);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    if (@available(iOS 13.0, *)) {
        _webMaskView.hidden = false;
        
        if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            [_webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#F8F8FF'" completionHandler:nil];
            [_webView evaluateJavaScript:@"document.body.style.backgroundColor=\"#1E1E1E\"" completionHandler:nil];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.webMaskView.hidden = true;
            });
        }
        
    }
}

@end
