//
//  HeartView.m
//  Bezier
//
//  Created by wheng on 17/5/18.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "HeartView.h"

@implementation HeartView

- (void)drawRect:(CGRect)rect {
    
    // Drawing code
    // 初始化UIBezierPath
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 首先设置一个起始点
    CGPoint startPoint = CGPointMake(rect.origin.x + rect.size.width/2,rect.origin.y + rect.size.height/10*3);
    
    
    // 以起始点为路径的起点
    [path moveToPoint:startPoint];
    // 设置一个终点
    CGPoint endPoint = CGPointMake(rect.origin.x + rect.size.width/2,rect.origin.y + rect.size.height);
    // 设置第一个控制点
    CGPoint controlPoint1 = CGPointMake((rect.origin.x+rect.size.width/2) + rect.size.width/10*4, rect.origin.y  - rect.size.height/20*3);
    // 设置第二个控制点
    CGPoint controlPoint2 = CGPointMake((rect.origin.x+rect.size.width/2)+ rect.size.width/4*3, rect.origin.y + rect.size.height/10*6);
    // 添加三次贝塞尔曲线
    [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    
    
    // 设置另一个起始点
    [path moveToPoint:endPoint];
    // 设置第三个控制点
    CGPoint controlPoint3 = CGPointMake((rect.origin.x+rect.size.width/2) - rect.size.width/10*4, rect.origin.y  - rect.size.height/20*3);

    // 设置第四个控制点
    CGPoint controlPoint4 = CGPointMake((rect.origin.x+rect.size.width/2) - rect.size.width/4*3, rect.origin.y + rect.size.height/10*6);
    // 添加三次贝塞尔曲线
    [path addCurveToPoint:startPoint controlPoint1:controlPoint4 controlPoint2:controlPoint3];
    
    
    
    
    
    // 设置线宽
    path.lineWidth = 3;
    // 设置线断面类型
    path.lineCapStyle = kCGLineCapRound;
    // 设置连接类型
    path.lineJoinStyle = kCGLineJoinRound;
    // 设置画笔颜色
    [[UIColor redColor] set];
    [path stroke];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
