//
//  ViewController.m
//  testView
//
//  Created by jay on 16/3/25.
//  Copyright © 2016年 曾辉. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *iView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 20)];
    [self.view addSubview:iView];
    
    UIGraphicsBeginImageContext(iView.frame.size); //参数size为新创建的位图上下文的大小
    [iView.image drawInRect:CGRectMake(0, 0, iView.frame.size.width, iView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapSquare); //设置线段收尾样式
    
    CGFloat length[] = {20,40}; // 线的宽度，间隔宽度
    CGContextRef line = UIGraphicsGetCurrentContext(); //设置上下文
    CGContextSetStrokeColorWithColor(line, [UIColor redColor].CGColor);
    CGContextSetLineWidth(line, 5); //设置线粗细
    CGContextSetLineDash(line, 0, length, 2);//画虚线
    CGContextMoveToPoint(line, 0, 20.0); //开始画线
    CGContextAddLineToPoint(line, self.view.frame.size.width, 20);//画直线
    CGContextStrokePath(line); //指定矩形线
    
    // 在line 中间的间隔里 再画一条不同颜色的间隔线
//    CGContextRef line2 = UIGraphicsGetCurrentContext();
//    CGContextSetStrokeColorWithColor(line2, [UIColor blackColor].CGColor);
//    CGContextSetLineWidth(line2, 5);
//    CGContextSetLineDash(line2, 0, length, 2);//画虚线
//    CGContextMoveToPoint(line2, 30, 20.0); //开始画线 参数对象，X坐标，Y坐标
//    CGContextAddLineToPoint(line2, self.view.frame.size.width, 20);
//    CGContextStrokePath(line2);
    
    iView.image = UIGraphicsGetImageFromCurrentImageContext();
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
