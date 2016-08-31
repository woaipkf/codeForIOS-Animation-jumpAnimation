//
//  ViewController2.m
//  test
//
//  Created by liuxiaodan on 14/11/22.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <math.h>



@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
  //  UIImage *btnBg = [[UIImage imageNamed:@"playerpaopaostarkeyword"] stretchableImageWithLeftCapWidth:15 topCapHeight:0];
    UIView *viewtemp = [[UIView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 300)];
    [viewtemp setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewtemp];
    self.anView = viewtemp;
    [viewtemp release];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    button.center = self.view.center;
    [button setFrame:CGRectMake(button.frame.origin.x, button.frame.origin.y+100, button.frame.size.width, button.frame.size.height)];
    [button setBackgroundColor:[UIColor blueColor]];
    [button addTarget:self action:@selector(addAnimationForLayer) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"do animation" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button release];
    [self paintOnView];
}
- (void)paintOnView
{
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake( self.anView.frame.origin.x,  self.anView.frame.origin.y, 30, 30);
    [layer setBackgroundColor:[UIColor redColor].CGColor];
    [self.anView.layer addSublayer:layer];
    self.anLayer = layer;
}
-(void)addAnimationForLayer
{
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(14.5, 119.5)];
    [bezierPath addCurveToPoint: CGPointMake(123.5, 119.5) controlPoint1: CGPointMake(14.5, 119.5) controlPoint2: CGPointMake(62.46, -58.25)];
 
    [bezierPath stroke];
    
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 1;
    [animation setDelegate:self];
    animation.path = bezierPath.CGPath;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = 0;
    [animation setValue:@"animation1" forKey:@"animType"];
    
    CABasicAnimation *tanimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    tanimation.duration = 0.5;
    tanimation.repeatCount = 2;
    tanimation.fromValue = [NSNumber numberWithFloat:0];
    tanimation.toValue = [NSNumber numberWithFloat:3.1415926];
    
    
    [self.anLayer addAnimation:tanimation forKey:@"tanimaiton1"];
    
    [self.anLayer addAnimation:animation forKey:@"animaiton1"];
    [bezierPath closePath];
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if ([[anim valueForKey:@"animType"] isEqualToString:@"animation1"]) {
        [self.anLayer setFrame:CGRectMake(((CALayer*)self.anLayer.presentationLayer).frame.origin.x,((CALayer*)self.anLayer.presentationLayer).frame.origin.y, self.anLayer.frame.size.width, self.anLayer.frame.size.height)];
        
        [self.anLayer removeAllAnimations];
        
        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
        [bezierPath moveToPoint: CGPointMake(123.5, 119.5)];
        [bezierPath addCurveToPoint: CGPointMake(176.5, 119.5) controlPoint1: CGPointMake(123.5, 119.5) controlPoint2: CGPointMake(146.82, 25)];
        
        [bezierPath stroke];
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        animation.duration = 0.5;
        [animation setDelegate:self];
        animation.path = bezierPath.CGPath;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        animation.repeatCount = 0;
        [animation setValue:@"animation2" forKey:@"animType"];
        
        CABasicAnimation *tanimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        tanimation.duration = 0.5;
        tanimation.repeatCount = 1;
        tanimation.fromValue = [NSNumber numberWithFloat:0];
        tanimation.toValue = [NSNumber numberWithFloat:3.1415926];
        
        [self.anLayer addAnimation:tanimation forKey:@"tanimaiton2"];
        [self.anLayer addAnimation:animation forKey:@"animaiton2"];
        [bezierPath closePath];
        
    }
    if ([[anim valueForKey:@"animType"] isEqualToString:@"animation2"]) {
        [self.anLayer setFrame:CGRectMake(((CALayer*)self.anLayer.presentationLayer).frame.origin.x,((CALayer*)self.anLayer.presentationLayer).frame.origin.y, self.anLayer.frame.size.width, self.anLayer.frame.size.height)];
        
        [self.anLayer removeAllAnimations];
        
        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
        [bezierPath moveToPoint: CGPointMake(176.5, 119.5)];
        [bezierPath addCurveToPoint: CGPointMake(210.5, 119.5) controlPoint1: CGPointMake(176.5, 119.5) controlPoint2: CGPointMake(191.46, 58.75)];

        [bezierPath stroke];
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        animation.duration = 0.25;
        [animation setDelegate:self];
        animation.path = bezierPath.CGPath;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        animation.repeatCount = 0;
        [animation setValue:@"animation3" forKey:@"animType"];
        
        CABasicAnimation *tanimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        tanimation.duration = 0.25;
        tanimation.repeatCount = 1;
        tanimation.fromValue = [NSNumber numberWithFloat:0];
        tanimation.toValue = [NSNumber numberWithFloat:3.1415926];
        
        [self.anLayer addAnimation:tanimation forKey:@"tanimaiton3"];
        [self.anLayer addAnimation:animation forKey:@"animaiton3"];
        [bezierPath closePath];
        
    }
    if ([[anim valueForKey:@"animType"] isEqualToString:@"animation3"]) {
        [self.anLayer setFrame:CGRectMake(((CALayer*)self.anLayer.presentationLayer).frame.origin.x,((CALayer*)self.anLayer.presentationLayer).frame.origin.y, self.anLayer.frame.size.width, self.anLayer.frame.size.height)];
        [self.anLayer removeAllAnimations];
        
    }
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)dealloc{
    self.anView = nil;
    self.anLayer = nil;
    [super dealloc];
}

@end
