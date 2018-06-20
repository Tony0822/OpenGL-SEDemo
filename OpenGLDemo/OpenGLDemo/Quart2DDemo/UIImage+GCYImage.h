//
//  UIImage+GCYImage.h
//  OpenGLDemo
//
//  Created by gaochongyang on 2018/6/20.
//  Copyright © 2018年 gaochongyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GCYImage)
/**
 *  传入图片
 */
+ (UIImage *)drawImageWithImageName:(NSString *)name;
/**
 *  添加图片水印
 */
+ (UIImage *)drawWaterImageWithImage:(nullable UIImage *)image waterImage:(nullable UIImage *)waterImage waterImageRect:(CGRect)rect;
/**
 *  添加文字水印
 */
+ (nullable UIImage *)drawWaterImageWithImage:(nullable UIImage *)image text:(nullable NSString *)text textPoint:(CGPoint)point attributedString:(nullable NSDictionary< NSString *, id> *)attributed;
/**
 *  裁剪圆形图片
 */
+ (nullable UIImage *)drawClipCircleImageWithImage:(nullable UIImage *)image circleRect:(CGRect)rect;
/**
 *  裁剪圆形图片并设置边框大小和颜色
 */
+ (nullable UIImage *)drawClipCircleImageWithImage:(nullable UIImage *)image circleRect:(CGRect)rect borderWidth:(CGFloat)borderW borderColor:(nullable UIColor *)borderColor;

/**
 *  对View进行截屏
 */
+ (void)drawcutScreenWithView:(nullable UIView *)view successBlock:(nullable void(^)(UIImage * _Nullable image,NSData * _Nullable imagedata))block;
/**
 *  对view的某一部分进行裁剪
 */
+ (void)drawcutScreenWithView:(nullable UIView *)view cutFrame:(CGRect)frame successBlock:(nullable void(^)(UIImage * _Nullable image,NSData * _Nullable imagedata))block;

/**
 *  传入一个ImageView，添加向下透明区域
 */
- (nullable UIImage *)drawwipeImageWithView:(nullable UIView *)view currentPoint:(CGPoint)nowPoint size:(CGSize)size;

@end
