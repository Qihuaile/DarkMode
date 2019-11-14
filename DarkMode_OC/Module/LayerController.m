//
//  LayerController.m
//  DarkMode_OC
//
//  Created by shqq on 2019/11/11.
//  Copyright © 2019 shqq. All rights reserved.
//

#import "LayerController.h"

@interface LayerController()

@end

@implementation LayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = BG_COLOR;
    
    // layer 颜色
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(30, UIApplication.sharedApplication.statusBarFrame.size.height + 44 + 15, UIScreen.mainScreen.bounds.size.width-60, 40);
    layer.dynamic_backgroundColor = WHITE_COLOR;
    layer.dynamic_borderColor = DETAIL_COLOR; // 加个框框
    layer.borderWidth = 1;
    layer.cornerRadius = 10; // 搞个圆角
    
    UIBezierPath *layerBezierPath = [UIBezierPath bezierPathWithRoundedRect:layer.bounds cornerRadius:10];
    layer.dynamic_shadowColor = TITLE_COLOR;
    layer.shadowPath = layerBezierPath.CGPath;
    layer.shadowOffset = CGSizeMake(0, 5);
    layer.shadowRadius = 10;
    layer.shadowOpacity = 1;
    
    UILabel *layerLabel = [[UILabel alloc] initWithFrame:layer.frame];
    layerLabel.text = @"layer 颜色配置";
    layerLabel.textColor = TITLE_COLOR;
    layerLabel.textAlignment = NSTextAlignmentCenter;
    
    
    
    // shapeLayer 颜色
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(layer.frame.origin.x,
                                  layer.frame.origin.y + layer.frame.size.height + 20,
                                  layer.frame.size.width,
                                  layer.frame.size.height);
    UIBezierPath *shapeBezierPath = [UIBezierPath bezierPathWithRoundedRect:shapeLayer.bounds cornerRadius:10];
//    shapeLayer.path = shapeBezierPath.CGPath;
    shapeLayer.dynamic_backgroundColor = WHITE_COLOR;
    shapeLayer.dynamic_borderColor = DETAIL_COLOR;
    shapeLayer.borderWidth = 1;
    shapeLayer.cornerRadius = 10;
    
    shapeLayer.dynamic_shadowColor = TITLE_COLOR;
    shapeLayer.shadowPath = shapeBezierPath.CGPath;
    shapeLayer.shadowOffset = CGSizeMake(0, 5);
    shapeLayer.shadowRadius = 10;
    shapeLayer.shadowOpacity = 1;
    
    
    UILabel *shapeLayerLabel = [[UILabel alloc] initWithFrame:shapeLayer.frame];
    shapeLayerLabel.text = @"shapeLayer 颜色配置";
    shapeLayerLabel.textColor = TITLE_COLOR;
    shapeLayerLabel.textAlignment = NSTextAlignmentCenter;
    
    // shapeLayer1 颜色
    CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
    shapeLayer1.frame = CGRectMake(shapeLayer.frame.origin.x,
                                    shapeLayer.frame.origin.y + shapeLayer.frame.size.height + 20,
                                    shapeLayer.frame.size.width,
                                    shapeLayer.frame.size.height);
    UIBezierPath *shape1BezierPath = [UIBezierPath bezierPathWithRoundedRect:shapeLayer1.bounds cornerRadius:10];
    shapeLayer1.path = shape1BezierPath.CGPath;
    shapeLayer1.dynamic_fillColor = WHITE_COLOR;
    shapeLayer1.dynamic_strokeColor = DETAIL_COLOR;
    shapeLayer1.lineWidth = 1;
    
    shapeLayer1.dynamic_shadowColor = TITLE_COLOR;
    shapeLayer1.shadowPath = shape1BezierPath.CGPath;
    shapeLayer1.shadowOffset = CGSizeMake(0, 5);
    shapeLayer1.shadowRadius = 10;
    shapeLayer1.shadowOpacity = 1;
    
    
    UILabel *shapeLayer1Label = [[UILabel alloc] initWithFrame:shapeLayer1.frame];
    shapeLayer1Label.text = @"shapeLayer1 颜色配置";
    shapeLayer1Label.textColor = TITLE_COLOR;
    shapeLayer1Label.textAlignment = NSTextAlignmentCenter;
    
    
    // 搞一个渐变layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(shapeLayer1.frame.origin.x,
                                    shapeLayer1.frame.origin.y + shapeLayer1.frame.size.height + 20,
                                    shapeLayer1.frame.size.width,
                                    shapeLayer1.frame.size.height);
    gradientLayer.cornerRadius = 10;
//    gradientLayer.dynamic_backgroundColor = WHITE_COLOR;
    
    gradientLayer.dynamic_gradientColors = @[HEAD_COLOR,THEME_COLOR];
    gradientLayer.locations = @[@0, @1];
    gradientLayer.startPoint = CGPointMake(1, 1);
    gradientLayer.endPoint = CGPointMake(0, 1);
    
    UIBezierPath *gradientBezierPath = [UIBezierPath bezierPathWithRoundedRect:gradientLayer.bounds cornerRadius:10];
    gradientLayer.dynamic_shadowColor = TITLE_COLOR;
    gradientLayer.shadowPath = gradientBezierPath.CGPath;
    gradientLayer.shadowOffset = CGSizeMake(0, 5);
    gradientLayer.shadowRadius = 10;
    gradientLayer.shadowOpacity = 1;
    
    UILabel *gradientLayerLabel = [[UILabel alloc] initWithFrame:gradientLayer.frame];
    gradientLayerLabel.text = @"gradientLayerLabel 颜色配置";
    gradientLayerLabel.textColor = UIColor.yellowColor;
    gradientLayerLabel.textAlignment = NSTextAlignmentCenter;
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(gradientLayer.frame.origin.x,
                                                                           gradientLayer.frame.origin.y + gradientLayer.frame.size.height + 20,
                                                                           gradientLayer.frame.size.width,
                                                                           400)];
    [imageView setImage:[UIImage imageNamed:@"delicious"]];
    imageView.backgroundColor = UIColor.redColor;
    imageView.layer.dynamic_borderColor = DETAIL_COLOR;
    imageView.layer.cornerRadius = 10;
    imageView.layer.borderWidth = 1;
    [imageView shq_SetCornerWithCornerRadii:CGSizeMake(10, 10) backgroudColor:BG_COLOR];
    
    
    [self.view.layer addSublayer:layer];
    [self.view addSubview:layerLabel];
    [self.view.layer addSublayer:shapeLayer];
    [self.view addSubview:shapeLayerLabel];
    [self.view.layer addSublayer:shapeLayer1];
    [self.view addSubview:shapeLayer1Label];
    [self.view.layer addSublayer:gradientLayer];
    [self.view addSubview:gradientLayerLabel];
    
    [self.view addSubview:imageView];
    
    
}

@end
