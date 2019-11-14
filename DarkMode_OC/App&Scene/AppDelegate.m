//
//  AppDelegate.m
//  DarkMode_OC
//
//  Created by shqq on 2019/11/11.
//  Copyright © 2019 shqq. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "UIColor+dynamicColor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSSetUncaughtExceptionHandler(&getException);
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    _window.backgroundColor = WHITE_COLOR;
    [_window makeKeyAndVisible];
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    _window.rootViewController = navVC;
    
    return YES;
}
//获得异常的C函数
void getException(NSException *exception)
{
    NSLog(@"名字：%@",exception.name);
    NSLog(@"原因：%@",exception.reason);
    NSLog(@"用户信息：%@",exception.userInfo);
    NSLog(@"栈内存地址：%@",exception.callStackReturnAddresses);
    NSLog(@"栈描述：%@",exception.callStackSymbols);
    //每次启动的时候将，捕获的异常信息，反馈给服务器
    //获取当前设备
    UIDevice *divice=[UIDevice currentDevice];
    //1.系统版本
    NSString *systemVersion=divice.systemVersion;
    //2.app当前版本
    //先获取当前infoplist文件数据
    NSDictionary *infoDic=[[NSBundle mainBundle] infoDictionary];
    //然后从字典中取出版本号
    NSString *version=[infoDic objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"系统版本%@",version);
    //3.系统时间
    NSDate *date=[NSDate date];
    //4.设备种类
    NSString *model=divice.model;
    //将捕获的异常数据进行保存，保存到本地
    //可以在下一次启动的时候将数据发给服务器
}


@end
