//
//  CALayer+DynamicColor.m
//  HdxHost
//
//  Created by shqq on 2019/11/3.
//  Copyright © 2019 shqq. All rights reserved.
//

#import "CALayer+DynamicColor.h"
#import <objc/runtime.h>

@implementation CALayer (DynamicColor)

- (void)setDynamicColor {
    [CATransaction begin];
    [CATransaction setDisableActions:YES]; // 禁用隐式动画，否则在调完color回到主界面会有动画
    
    if([self isMemberOfClass:CAShapeLayer.class]) { // 设置CAShapeLayer
        CAShapeLayer *shapeLayer = (CAShapeLayer *)self;
        
        if (self.dynamic_fillColor != nil) {
            shapeLayer.fillColor = shapeLayer.dynamic_fillColor.CGColor;
        }
        if (self.dynamic_strokeColor != nil) {
            shapeLayer.strokeColor = shapeLayer.dynamic_strokeColor.CGColor;
        }
        
    } else if ([self isMemberOfClass:CAGradientLayer.class] && self.dynamic_gradientColors != nil) { // 设置CAGradientLayer colors
        NSMutableArray *colors = [NSMutableArray arrayWithCapacity:self.dynamic_gradientColors.count];
        // 遍历 dynamic_gradientColors的元素，添加元素对应的CGColor到colors中
        for (int i=0; i<self.dynamic_gradientColors.count; i++) {
            colors[i] = (__bridge id _Nonnull)([self.dynamic_gradientColors[i] CGColor]);
        }
        CAGradientLayer *gradientLayer = (CAGradientLayer *)self;
        gradientLayer.colors = colors;
    }
    if(self.dynamic_backgroundColor != nil){ // 非CAShapeLayer和GradientLayer，设置背景色
        self.backgroundColor = self.dynamic_backgroundColor.CGColor;
    }
    
    if (self.dynamic_shadowColor != nil) { // 阴影设置
        self.shadowColor = self.dynamic_shadowColor.CGColor;
    }
    if (self.dynamic_borderColor != nil) { // 边框设置
        self.borderColor = self.dynamic_borderColor.CGColor;
    }
    
    if (self.dynamic_fillColor != nil
        && self.dynamic_contents != nil
        && self.dynamic_fillPath != nil) { // imageView设置圆角

        CGImageRef cgImage = (__bridge CGImageRef)(self.dynamic_contents);
        
        // 这里通过content的图片获取context. 要用图片的宽高除以scale
        CGContextRef context = CGBitmapContextCreate(nil,
                                                  CGImageGetWidth(cgImage)/UIScreen.mainScreen.scale,
                                                  CGImageGetHeight(cgImage)/UIScreen.mainScreen.scale,
                                                  CGImageGetBitsPerComponent(cgImage),
                                                  CGImageGetBytesPerRow(cgImage),
                                                  CGImageGetColorSpace(cgImage),
                                                  CGImageGetBitmapInfo(cgImage));
        if (!context) return;
        
        CGContextSetFillColorWithColor(context, self.dynamic_fillColor.CGColor);
        
        UIBezierPath *bezierPath_Fill = [UIBezierPath bezierPathWithRect:self.bounds];
        // 添加两条path， 一个bounds方框，一个要展示头像的样式圆
        CGContextAddPath(context, self.dynamic_fillPath.CGPath);
        CGContextAddPath(context, bezierPath_Fill.CGPath);
        // drawPath： kCGPathEOFill 奇偶规则，异或。 相当于swift该语法中的 .xor
        CGContextDrawPath(context, kCGPathEOFill);
        
        // 去除cgImageshe知道context中
        self.contents = (__bridge id _Nullable)(CGBitmapContextCreateImage(context));
        
        // 释放 context
        CGContextRelease(context);
    }
    
    [CATransaction commit];
        
}

#pragma mark -- getter/Setter

- (UIColor *)dynamic_backgroundColor {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setDynamic_backgroundColor:(UIColor *)dynamic_backgroundColor {
    objc_setAssociatedObject(self, @selector(dynamic_backgroundColor), dynamic_backgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)dynamic_fillColor {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setDynamic_fillColor:(UIColor *)dynamic_fillColor {
//    #ifdef DEBUG
//        if (self.name) {
//            DLog(@"--shqq  %@   setDynamic_fillColor:%@",self.name,dynamic_fillColor);
//        }
//    #endif
    objc_setAssociatedObject(self, @selector(dynamic_fillColor), dynamic_fillColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)dynamic_strokeColor {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setDynamic_strokeColor:(UIColor *)dynamic_strokeColor {
    objc_setAssociatedObject(self, @selector(dynamic_strokeColor), dynamic_strokeColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)dynamic_borderColor {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setDynamic_borderColor:(UIColor *)dynamic_borderColor {
    objc_setAssociatedObject(self, @selector(dynamic_borderColor), dynamic_borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)dynamic_gradientColors {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setDynamic_gradientColors:(NSArray *)dynamic_gradientColors {
    objc_setAssociatedObject(self, @selector(dynamic_gradientColors), dynamic_gradientColors, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (UIColor *)dynamic_shadowColor {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setDynamic_shadowColor:(NSArray *)dynamic_shadowColor {
    objc_setAssociatedObject(self, @selector(dynamic_shadowColor), dynamic_shadowColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)dynamic_fillPath {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setDynamic_fillPath:(UIBezierPath *)dynamic_fillPath {
    objc_setAssociatedObject(self, @selector(dynamic_fillPath), dynamic_fillPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)dynamic_contents {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setDynamic_contents:(id)dynamic_contents {
    objc_setAssociatedObject(self, @selector(dynamic_contents), dynamic_contents, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end


@implementation UIView (DynamicColor)

+ (void)load {

    Method layoutSubviews = class_getInstanceMethod(self, @selector(layoutSubviews));
    Method swizzling_layoutSubviews = class_getInstanceMethod(self, @selector(swizzling_layoutSubviews));
    method_exchangeImplementations(layoutSubviews, swizzling_layoutSubviews);
}
- (void)swizzling_layoutSubviews{
    
    if (self.layer.sublayers.count > 0) {
        for (CALayer *layer in self.layer.sublayers) {
            
            [layer setDynamicColor];
        }
    }
    [self.layer setDynamicColor];
    
    [self swizzling_layoutSubviews];
}


@end
