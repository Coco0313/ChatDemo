//
//  ContextDrawLine.m
//  ChatDemo
//
//  Created by youye on 16/1/21.
//  Copyright © 2016年 youye. All rights reserved.
//

#import "ContextDraw.h"

@implementation ContextDraw


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    // 创建路径并获取句柄
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // CGPoint 画直线: 对该视图描边，效果类似用.layer.width效果
    CGContextMoveToPoint(context, rect.origin.x, rect.origin.y);  // 绘画原点
    CGContextAddLineToPoint(context, rect.origin.x+rect.size.width, rect.origin.y);
    CGContextAddLineToPoint(context, rect.origin.x+rect.size.width, rect.origin.y+rect.size.height);
    CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y+rect.size.height);
    CGContextClosePath(context);  // 闭合路线，即连接到原点
    
    CGContextStrokePath(context); // 渲染路径
    
    // 设置填充颜色，仅填充4条边
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5].CGColor);
    // 等同于如下:
    //CGContextSetRGBStrokeColor(context, 1, 1, 1, 0.5);
    // 也可以直接用颜色进行设置,等同于如下:
    //[[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] set];
    
    // 设置线宽为1
    CGContextSetLineWidth(context, 1.0);
    
    // 设置直线的样式
    CGContextSetLineCap(context, kCGLineCapRound);
    // 设置线拐角处类型
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    // 设置长方形4个顶点
    CGPoint points[] = { CGPointMake(rect.origin.x+2,rect.origin.y+2),
                        CGPointMake(rect.origin.x+rect.size.width-2, rect.origin.y+2),
                        CGPointMake(rect.origin.x+rect.size.width-2, rect.origin.y+rect.size.height-2),
                        CGPointMake(rect.origin.x+2, rect.origin.y+rect.size.height-2) };
    
    // 开始绘制
    CGContextBeginPath(context);
    CGContextAddLines(context, points, 4);
    CGContextClosePath(context);
    
    CGContextStrokePath(context);
    
    
    
    // CGContextAddArc 画曲线
    
    
    
    
    // 画文字
    NSString *text = @"text";
    
    // 设置字体大小
    UIFont *font = [UIFont systemFontOfSize:14];
    
    NSDictionary *att = @{ NSFontAttributeName: font,
                           NSForegroundColorAttributeName: [UIColor redColor],
                           NSUnderlineStyleAttributeName: @(5)};
    
    // 在指定(x,y)位置画文字，宽度为8
    [text drawAtPoint:CGPointMake(5, 5) withAttributes:att];
    
    // 在指定(x,y,w,h)区域内画文字
//    text drawWithRect:CGRectMake(15, 15, 15, 15) options:NSStringDrawingUsesFontLeading attributes:att context:<#(nullable NSStringDrawingContext *)#>
}




























@end
