//
//  ViewController.m
//  Bezier
//
//  Created by wheng on 17/5/17.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "BezierView.h"
#import "HeartView.h"

@interface ViewController () <CAAnimationDelegate>

@property (nonatomic, strong)CAKeyframeAnimation *animation;
@property (nonatomic, strong)UIBezierPath *linePath;
@property (nonatomic, strong)UIView *pointView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self bezier];
//    [self heartView];
}

- (void)heartView {
    
    HeartView *heart3 = [[HeartView alloc] initWithFrame:CGRectMake(0, 250, 150, 150)];
    [self.view addSubview:heart3];
    [heart3 setBackgroundColor:[UIColor clearColor]];

}

- (void)bezier {
    self.pointView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, -5, -5)];
    [self.view addSubview:self.pointView];
    [self.pointView setBackgroundColor:[UIColor blueColor]];
 //
    BezierView *lineView = [[BezierView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [lineView setBackgroundColor:[UIColor clearColor]];
//    [self.view addSubview:lineView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    UIBezierPath *bezier = [UIBezierPath bezierPath];
    
    [bezier moveToPoint:point];
    CGPoint endPoint = CGPointMake(50, [UIScreen mainScreen].bounds.size.height - 80);
    CGPoint controlPoint = CGPointMake([UIScreen mainScreen].bounds.size.width - 150,point.y - 100);
    [bezier addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    self.animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    self.animation.repeatCount = INTMAX_MAX;
    self.animation.path = bezier.CGPath;
    self.animation.duration = 0.3f;
    self.animation.removedOnCompletion = NO;
    self.animation.fillMode = kCAFillModeForwards;
    self.animation.delegate = self;
    [self.pointView.layer addAnimation:self.animation forKey:nil];
    
    for (UIView *obj in self.view.subviews) {
        if ([obj isEqual:self.pointView]) {
            continue;
        }
        [obj removeFromSuperview];
    }
    
    BezierView *line = [[BezierView alloc] initWithFrame:self.view.bounds startPoint:point endPoint:endPoint controlPoint:controlPoint];
    line.backgroundColor = [UIColor clearColor];
    [self.view addSubview:line];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
