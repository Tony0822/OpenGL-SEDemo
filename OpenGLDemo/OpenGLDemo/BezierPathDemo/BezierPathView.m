//
//  BezierPathView.m
//  OpenGLDemo
//
//  Created by gaochongyang on 2018/6/22.
//  Copyright © 2018年 gaochongyang. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"%s", __func__);
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"%s", __func__);
    [self drawRectangular];
    [self drawRectOval];
    [self drawRectRound];
    [self drawRectRound2];
    [self drawRectArc];
    [self drawRectArc2];
    [self drawRectTriangle];
    [self drawRectQuadbe];
    [self drawRectThreePath];
}
// 三次贝塞尔曲线
- (void)drawRectThreePath {
    UIBezierPath *threePath = [UIBezierPath bezierPath];
    [threePath moveToPoint:CGPointMake(30,250)];
    [threePath addCurveToPoint:CGPointMake(260,230) controlPoint1:CGPointMake(120,180) controlPoint2:CGPointMake(150,260)];
    threePath.lineWidth = 1.5f;
    threePath.lineCapStyle = kCGLineCapSquare;
    threePath.lineJoinStyle = kCGLineJoinRound;
    [[UIColor redColor] setStroke];
    [threePath stroke];
}
// 二次贝塞尔曲线
- (void)drawRectQuadbe {
    UIBezierPath *quadBe = [UIBezierPath bezierPath];
    [quadBe moveToPoint:CGPointMake(30,150)];
    [quadBe addQuadCurveToPoint:CGPointMake(130,150) controlPoint:CGPointMake(30,70)];
    
    UIBezierPath *quadBe2 = [UIBezierPath bezierPath];
    [quadBe2 moveToPoint:CGPointMake(160,150)];
    [quadBe2 addQuadCurveToPoint:CGPointMake(260,150) controlPoint:CGPointMake(210,50)];
    [quadBe2 appendPath:quadBe];
    quadBe2.lineWidth = 1.5f;
    quadBe2.lineCapStyle = kCGLineCapSquare;
    quadBe2.lineJoinStyle = kCGLineJoinRound;
    [[UIColor redColor] set];
    [quadBe2 stroke];
}
// 三角形
- (void)drawRectTriangle {
    UIBezierPath *triangle = [UIBezierPath bezierPath];
    [triangle moveToPoint:CGPointMake(145,165)];
    [triangle addLineToPoint:CGPointMake(155,185)];
    [triangle addLineToPoint:CGPointMake(135,185)];
    [[UIColor redColor] set];
    [triangle closePath];
    [triangle stroke];
}
// 添加一个弧线
- (void)drawRectArc2 {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(230, 30)];
    [path addArcWithCenter:CGPointMake(265, 30) radius:25 startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
//    [path appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(265, 30) radius:20 startAngle:M_PI_2 endAngle:M_PI*2 clockwise:YES]];
    [[UIColor redColor] setStroke];
    [path stroke];
}
// 以某一个中心点画圆弧
- (void)drawRectArc {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 20) radius:20 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [[UIColor redColor] set];
    [path stroke];
}
// 根据一个rect针对四角或多个角设置成圆角
- (void)drawRectRound2 {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(140, 5, 40, 30) byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 100)];
    [[UIColor redColor] set];
    [path fill];
    [path stroke];
}
// 根据rect画一个圆角矩形曲线， 当rect为正方形时且radius等于边长一半，画的是一个圆
- (void)drawRectRound {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(95, 5, 40, 30) cornerRadius:5];
    [[UIColor redColor] set];
    [path fill];
    [path stroke];
}
// 根据rect画一个椭圆， rect为正方形时画一个圆
- (void)drawRectOval {
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(40, 5, 50, 30)];
    [[UIColor redColor] set];
    [path fill];
    [path stroke];
}
// 根据rect画一个矩形曲线
- (void)drawRectangular {
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(5, 5, 30, 30)];
    [[UIColor redColor] set];
    [path fill];
    [[UIColor yellowColor] set];
    [path stroke];
}

@end
