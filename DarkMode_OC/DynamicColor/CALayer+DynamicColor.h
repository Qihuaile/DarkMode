//
//  CALayer+Utils.h
//  HdxHost
//
//  为常用layer设置颜色时，设置一个动态颜色
//
//  Created by shqq on 2019/11/3.
//  Copyright © 2019 shqq. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (DynamicColor)

@property (nullable, nonatomic, strong) UIColor *dynamic_backgroundColor;
@property (nullable, nonatomic, strong) UIColor *dynamic_borderColor;
@property (nullable, nonatomic, strong) UIColor *dynamic_shadowColor;

@property (nullable, nonatomic, strong) UIColor *dynamic_fillColor; // shapeLayer fillColor
@property (nullable, nonatomic, strong) UIColor *dynamic_strokeColor; // shapeLayer strokeColor

@property (nullable, nonatomic, copy) NSArray *dynamic_gradientColors;

// 为图片设置圆角时，绘制图片到圆角路径，并给圆角位置填充需要的背景颜色
@property (nullable, nonatomic, strong) UIBezierPath *dynamic_fillPath; // 图片设置圆角时填充路径
@property (nullable, strong) id dynamic_contents;

@end

