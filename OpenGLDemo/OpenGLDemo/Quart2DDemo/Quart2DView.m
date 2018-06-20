//
//  Quart2DView.m
//  OpenGLDemo
//
//  Created by gaochongyang on 2018/6/19.
//  Copyright © 2018年 gaochongyang. All rights reserved.
//

#import "Quart2DView.h"

@implementation Quart2DView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"%s", __func__);
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"%s", __func__);
    [self drawLine];
//    [self drawRectangle];
//    [self drawRoundNess];
//    [self drawText];
//    [self drawPicture];
//    [self drawPropress];
//    [self drawThreeLine];
    [self drawLineWithSrartColor:[UIColor redColor] endColor:[UIColor greenColor]];
}
// 创建渐变线
- (void)drawLineWithSrartColor:(UIColor *)startColor endColor:(UIColor *)endColor {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //4、设置颜色的location
    CGFloat locations[] = { 0.0, 1.0 };
    //5、创建一个颜色数组，由于NSArray里面只能存对象，所以需要桥接
    NSArray *colors = @[(__bridge id)startColor.CGColor,(__bridge id)endColor.CGColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    //释放
    CFRelease(colorSpace);
    //保存一份当前上下文，压栈
    CGContextSaveGState(ctx);
    //绘制一个矩形，矩形足够小，也可以是一条线
    CGFloat width = self.frame.size.width; CGContextMoveToPoint(ctx, 0, 120); CGContextAddLineToPoint(ctx, width, 120); CGContextAddLineToPoint(ctx, width, 123); CGContextAddLineToPoint(ctx, 0, 123);
    //裁剪
    CGContextEOClip(ctx);
    //绘制渐变
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(0, 100), CGPointMake(self.frame.size.width, 100), kCGGradientDrawsBeforeStartLocation);
    //恢复一份当前的上下文，出栈
    CGContextRestoreGState(ctx);
    //释放内存
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    

}
// 三条不同颜色的线
- (void)drawThreeLine {
//   UIBezierPath *path = [UIBezierPath bezierPath];
//    //设置线宽
//    path.lineWidth = 5;
    
    // 此方法只会显示最后设置的颜色值
//    [[UIColor cyanColor] setStroke];
//    [path moveToPoint:CGPointMake(10, 10)];
//    [path addLineToPoint:CGPointMake(10, 100)];
//
//    [[UIColor orangeColor] setStroke];
//    [path moveToPoint:CGPointMake(30, 10)];
//    [path addLineToPoint:CGPointMake(30, 100)];
//
//    [[UIColor greenColor] setStroke];
//    [path moveToPoint:CGPointMake(50, 10)];
//    [path addLineToPoint:CGPointMake(50, 100)];
    
    CGContextRef cyan = UIGraphicsGetCurrentContext();
    [[UIColor cyanColor] setStroke];
    CGContextSaveGState(cyan);
    
    CGContextRef orange = UIGraphicsGetCurrentContext();
    [[UIColor orangeColor] setStroke];
    CGContextSaveGState(orange);
    
    CGContextRef green = UIGraphicsGetCurrentContext();
    [[UIColor greenColor] setStroke];
    CGContextSaveGState(green);
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    //设置线宽
    path.lineWidth = 5;
    
    CGContextRestoreGState(cyan);
    [[UIColor cyanColor] setStroke];
    [path moveToPoint:CGPointMake(10, 10)];
    [path addLineToPoint:CGPointMake(10, 100)];
    [path stroke];

    path = [UIBezierPath bezierPath];
    CGContextRestoreGState(orange);
    [[UIColor orangeColor] setStroke];
    [path moveToPoint:CGPointMake(30, 10)];
    [path addLineToPoint:CGPointMake(30, 100)];
    [path stroke];

    path = [UIBezierPath bezierPath];
    CGContextRestoreGState(green);
    [[UIColor greenColor] setStroke];
    [path moveToPoint:CGPointMake(50, 10)];
    [path addLineToPoint:CGPointMake(50, 100)];
    [path stroke];

    
}
// 画进度条
- (void)drawPropress {
    CGFloat statrA = -M_PI_2;
    CGFloat endA = -M_PI_2 + self.progress * M_PI * 2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width *0.5, self.bounds.size.height * 0.5) radius:100 startAngle:statrA endAngle:endA clockwise:YES];
    [path stroke];
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    NSLog(@"%.2f%%",_progress*100);
//    [self setNeedsDisplay];
}
// 画图片
- (void)drawPicture {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    UIImage *image = [UIImage imageNamed:@"papapa"];
    CGRect rect = CGRectMake(100, 100, 100, 100);
//    [image drawInRect:rect];
    [image drawInRect:rect blendMode:kCGBlendModeMultiply alpha:0.8];
    CGContextStrokePath(contextRef);
}
// 画文字
- (void)drawText {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    NSString *str = @"我是draw绘制出来的文字";
    CGRect rect = CGRectMake(10, 100, self.bounds.size.width, 100);
    // 1. 简单样式
//    [str drawInRect:rect withAttributes:nil];
    // 2. 复杂样式
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    dict[NSBackgroundColorAttributeName] = [UIColor cyanColor];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    // 阴影颜色
    shadow.shadowColor = [UIColor yellowColor];
    // 阴影偏移量
    shadow.shadowOffset = CGSizeMake(2, 2);
    // 高斯模糊
    shadow.shadowBlurRadius = 5;
    
    dict[NSShadowAttributeName] = shadow;
    //字体间距
    dict[NSKernAttributeName] = @10;
    
    [str drawInRect:rect withAttributes:dict];
    CGContextStrokePath(contextRef);
}
// 圆形
- (void)drawRoundNess {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    // ArcCenter: 中心点
    // radius:半径
    // startAngle: 起始角度
    // endAngle: 结束角度
    // clockwise: 是否逆时针
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5) radius:self.bounds.size.width * 0.3 startAngle:0 endAngle:M_PI*2 clockwise:NO];
    // 通过椭圆画圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)];
    
    CGContextAddPath(contextRef, path.CGPath);
    
    [[UIColor redColor] setStroke];
    
    CGContextStrokePath(contextRef);
}
// 矩形
- (void)drawRectangle {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    // 1.
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(100, 100)];
//    [path addLineToPoint:CGPointMake(200, 100)];
//    [path addLineToPoint:CGPointMake(200, 300)];
//    [path addLineToPoint:CGPointMake(100, 300)];
//    [path closePath];
    
    // 2.
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 200)];
    // 设置填充颜色
    [[UIColor blueColor] set];
    CGContextAddPath(contextRef, path.CGPath);
//    CGContextSetLineWidth(contextRef, 20.f);
    // 设置填充路径
    CGContextFillPath(contextRef);
}
// 直线
- (void)drawLine {
    // 1.获取上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    // 2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(100, 100)];
    
    [path addLineToPoint:CGPointMake(100, 300)];
    
    // 设置描边颜色
    [[UIColor blueColor] setStroke];
    CGContextAddPath(contextRef, path.CGPath);
    CGContextSetLineWidth(contextRef, 20.f);
    // 设置描边路径
    CGContextStrokePath(contextRef);
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    NSLog(@"%s", __func__);
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    NSLog(@"%s", __func__);
}



@end
