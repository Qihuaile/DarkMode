//
//  UIImageView+CornerRadius.m
//  DarkMode_OC
//
//  Created by shqq on 2019/11/14.
//  Copyright © 2019 shqq. All rights reserved.
//

#import "UIImageView+CornerRadius.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation UIImageView (CornerRadius)

- (void)shq_SetCornerWithCornerRadii:(CGSize)cornerRadii backgroudColor:(UIColor *)bgColor {
    [self shq_SetCornerWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:cornerRadii backgroudColor:bgColor];
}

- (void)shq_SetCornerWithRoundedRect:(CGRect)rect
                   byRoundingCorners:(UIRectCorner)corners
                         cornerRadii:(CGSize)cornerRadii
                      backgroudColor:(UIColor *)bgColor {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = rect;
        [self.layer addSublayer:shapeLayer];
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:shapeLayer.bounds
                                                         byRoundingCorners:corners
                                                               cornerRadii:cornerRadii];
        UIGraphicsBeginImageContextWithOptions(shapeLayer.bounds.size, false, UIScreen.mainScreen.scale);
        UIGraphicsGetCurrentContext();
        shapeLayer.dynamic_fillColor = bgColor;
        shapeLayer.dynamic_fillPath = bezierPath;
        shapeLayer.dynamic_contents = (__bridge id _Nullable)(UIGraphicsGetImageFromCurrentImageContext().CGImage);
        
        UIGraphicsEndImageContext();
    });
    
}

@end
