//
//  UIImageView+CornerRadius.h
//  DarkMode_OC
//
//  Created by shqq on 2019/11/14.
//  Copyright © 2019 shqq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (CornerRadius)
- (void)shq_SetCornerWithCornerRadii:(CGSize)cornerRadii backgroudColor:(UIColor *)bgColor;
@end

NS_ASSUME_NONNULL_END
