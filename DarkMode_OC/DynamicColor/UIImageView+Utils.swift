//
//  UIImageView+Utils.swift
//  HdxHost
//
//  Created by shqq on 2019/10/28.
//  Copyright © 2019 shqq. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
//    - (UIImageView *)imageView:(UIImageView *)imageView withCornerRadius:(CGFloat)cornerRadius{
//        CGFloat w = imageView.frame.size.width;
//        CGFloat h = imageView.frame.size.height;
//        CGSize size = imageView.frame.size;
//        CGRect imageRect = CGRectMake(0, 0, w, h);
//
//        if(cornerRadius < 0) {
//            cornerRadius = 0;
//        }else if(cornerRadius < MIN(w, h)) {
//            cornerRadius = MIN(w, h);
//        }
//
//        UIImage *image = imageView.image;
//        UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
//        [[UIBezierPath bezierPathWithRoundedRect:imageRect cornerRadius:cornerRadius] addClip];
//        [image drawInRect:imageRect];
//        image = UIGraphicsGetImageFromCurrentImageContext();
//        [imageView setImage:image];
//        UIGraphicsEndImageContext();
//        return imageView;
//    }
    
//    /**
//        画一个圆角图片并设置到imageView
//        image：原始图片
//        roundingCorners：圆角位置
//        cornerRaddi ：圆角size
//     */
//    @objc func drawCornerImage(image:UIImage,roundingCorners:UIRectCorner ,cornerRaddi:CGSize) {
//        guard image != nil else {
//            return
//        }
//        DispatchQueue.global().async {
//
//            let rect = CGRect.init(x: 0, y: 0, width: image.size.width, height: image.size.height)
//            
//            UIGraphicsBeginImageContextWithOptions(image.size, false, UIScreen.main.scale) // 开始图形上下文
//            let context:CGContext = UIGraphicsGetCurrentContext()!
//            // 添加绘制路线
//            context.addPath(UIBezierPath.init(roundedRect: rect,
//                                                byRoundingCorners: roundingCorners,
//                                                cornerRadii: cornerRaddi).cgPath)
//            context.clip() // 裁剪
//            image.draw(in: rect) // 图片画到上下文
//            context.drawPath(using: .fillStroke)
//            
//            let output = UIGraphicsGetImageFromCurrentImageContext() ?? image
//            
//            UIGraphicsEndImageContext() // 关闭图形上下文
//            DispatchQueue.main.async {
//                self.image = output
//            }
//        }
//        
//    }
//    
//    /**
//        画一个圆形图片并设置到imageView
//     */
//    @objc func drawCircleImage(image:UIImage) {
//        guard image != nil else {
//            return
//        }
//        DispatchQueue.global().async {
//            let rect = CGRect.init(x: 0, y: 0, width: image.size.width, height: image.size.height)
//            
//            UIGraphicsBeginImageContextWithOptions(image.size, false, UIScreen.main.scale)
//            let context = UIGraphicsGetCurrentContext()!
//            
//            context.addEllipse(in: rect) // 画圆
//            context.clip()
//            image.draw(in: rect)
//            
//            let output = UIGraphicsGetImageFromCurrentImageContext() ?? image
//            
//            UIGraphicsEndImageContext()
//            DispatchQueue.main.async {
//                self.image = output
//            }
//        }
//    }
//    @objc func setCornerRadius(cornerRaddi:CGSize, bgColor:UIColor) {
//        self.setCornerRadius(roundingCorners: UIRectCorner.allCorners, cornerRaddi: cornerRaddi, bgColor: bgColor)
//    }
//    /**
//        混合图层，形成视觉上的圆角
//        roundingCorners，与目标圆角位置相反 ，bitMap中坐标系可能变化了
//     */
//    @objc func setCornerRadius(roundingCorners:UIRectCorner ,cornerRaddi:CGSize, bgColor:UIColor) {
//        assert(self.bounds != .zero)
//
//        DispatchQueue.global().async {
//
//            let shapeLayer = CAShapeLayer.init()
//            shapeLayer.frame = self.bounds
//            self.layer.addSublayer(shapeLayer)
//            
//            UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
//            UIGraphicsGetImageFromCurrentImageContext()
//            let bezierPath = UIBezierPath.init(roundedRect: shapeLayer.bounds, byRoundingCorners: roundingCorners, cornerRadii: cornerRaddi)
//
//            shapeLayer.dynamic_fillColor = bgColor
//            shapeLayer.dynamic_fillPath = bezierPath
//            // 应该传递.cgImaged，但是报错 ： -[Not A Type retain]: message sent to deallocated instance 0x7ff58afee4f0。
//            // 不知道为什么，又正常了。 不是这里原因。cgcolor在swift和oc混编问题
//            if let output = UIGraphicsGetImageFromCurrentImageContext()?.cgImage {
//                shapeLayer.dynamic_contents = output
//            }
//            UIGraphicsEndImageContext()
//        }
//        
//    }
    
}
