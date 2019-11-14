//
//  UIColor+dynamicColor.h
//  DarkMode_OC
//
//  获取一个动态颜色
//  Created by shqq on 2019/11/11.
//  Copyright © 2019 shqq. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WHITE_COLOR [UIColor initWithLightColor:0xffffff darkColor:0x1c1c1d]
#define BG_COLOR [UIColor initWithLightColor:0xf7f9fc darkColor:0x000000]
#define THEME_COLOR [UIColor initWithLightColor:0x03b349 darkColor:0x03b349]
#define LINE_COLOR [UIColor initWithLightColor:0xe5e5e5 darkColor:0x3d3d40]

#define HEAD_COLOR [UIColor initWithLightColor:0x171717 darkColor:0xeeeeee]
#define TITLE_COLOR [UIColor initWithLightColor:0x333333 darkColor:0xdedede]
#define DETAIL_COLOR [UIColor initWithLightColor:0x999999 darkColor:0x9c9c9c]

@interface UIColor (dynamicColor)

+ (instancetype)initWithLightColor:(NSInteger)lightColor darkColor:(NSInteger)darkColor;

@end
