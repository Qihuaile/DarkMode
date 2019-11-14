//
//  UIColor+dynamicColor.m
//  DarkMode_OC
//
//  Created by shqq on 2019/11/11.
//  Copyright © 2019 shqq. All rights reserved.
//

#import "UIColor+dynamicColor.h"

@implementation UIColor (dynamicColor)

+ (instancetype) initWithRGB:(NSInteger)rgb {
    
    return [UIColor colorWithRed:((rgb & 0xFF0000) >> 16) /255.0
                           green:((rgb & 0xFF00) >> 8) /255.0
                            blue:(rgb & 0xFF) /255.0
                           alpha:1.0];
}

+ (instancetype)initWithLightColor:(NSInteger)lightColor darkColor:(NSInteger)darkColor {
    
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if(traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return [UIColor initWithRGB:darkColor];
            } else {
                return [UIColor initWithRGB:lightColor];
            }
        }];
    } else {
        return [UIColor initWithRGB:lightColor];
    }
}

@end
