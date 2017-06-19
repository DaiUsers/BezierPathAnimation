//
//  BezierView.m
//  Bezier
//
//  Created by wheng on 17/5/18.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "BezierView.h"

@interface BezierView ()

@property (nonatomic, assign)CGPoint startPoint;
@property (nonatomic, assign)CGPoint endPoint;
@property (nonatomic, assign)CGPoint controlPoint;

@end

@implementation BezierView

- (instancetype)initWithFrame:(CGRect)frame startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint {
    self = [super initWithFrame:frame];
    if (self) {
        self.startPoint = startPoint;
        self.endPoint   = endPoint;
        self.controlPoint = controlPoint;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIColor *green = [UIColor greenColor];
    [green set];
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath setLineWidth:2];
    linePath.lineCapStyle = kCGLineCapRound;
    linePath.lineJoinStyle = kCGLineJoinRound;
    [linePath moveToPoint:self.startPoint];
//    [linePath addLineToPoint:CGPointMake(90, 100)];
//    [linePath addLineToPoint:CGPointMake(10, 200)];
    
    [linePath addQuadCurveToPoint:self.endPoint controlPoint:self.controlPoint];
   
//    [linePath fill];
//    [linePath closePath];

    [linePath stroke];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
