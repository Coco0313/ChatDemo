//
//  QuartzLinesView.m
//  DrawDemo
//
//  Created by mac on 16/3/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QuartzLinesView.h"

@implementation QuartzLinesView

/*
   白色: (1.0, 1.0, 1.0, 1.0)
   红色: 
   黑色:
 */
-(void)drawInContext:(CGContextRef)context
{
    // 设置绘制的路径颜色
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    // 设置绘制的填充颜色
    //CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
    
    // 设置默认绘制的宽度
    CGContextSetLineWidth(context, 2);
    
    // 画一条水平线
    CGContextMoveToPoint(context, 40, 30);
    CGContextMoveToPoint(context, self.frame.size.width-80, 30);
    // 填充路径
    CGContextStrokePath(context);
    
    
    // Draw a connected sequence of line segments
    CGPoint addLines[] =
    {
        CGPointMake(10.0, 90.0),
        CGPointMake(70.0, 60.0),
        CGPointMake(130.0, 90.0),
        CGPointMake(190.0, 60.0),
        CGPointMake(250.0, 90.0),
        CGPointMake(310.0, 60.0),
    };
    // Bulk call to add lines to the current path.
    // Equivalent to MoveToPoint(points[0]); for(i=1; i<count; ++i) AddLineToPoint(points[i]);
    CGContextAddLines(context, addLines, sizeof(addLines)/sizeof(addLines[0]));
    CGContextStrokePath(context);
    
    
    
    // Draw a series of line segments. Each pair of points is a segment
    // 这个是间接的绘制路径
    CGPoint strokeSegments[] =
    {
        CGPointMake(10.0, 50.0),
        CGPointMake(70.0, 20.0),
        CGPointMake(130.0, 50.0),
        CGPointMake(190.0, 20.0),
        CGPointMake(250.0, 50.0),
        CGPointMake(310.0, 20.0),
    };
    // Bulk call to stroke a sequence of line segments.
    // Equivalent to for(i=0; i<count; i+=2) { MoveToPoint(point[i]); AddLineToPoint(point[i+1]); StrokePath(); }
    CGContextStrokeLineSegments(context, strokeSegments, sizeof(strokeSegments)/sizeof(strokeSegments[0]));
}

@end





@implementation QuartzCapJoinWidthView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.cap = kCGLineCapButt;
        self.join = kCGLineJoinMiter;
        self.width = 15.0;
    }
    return self;
}

-(void)drawInContext:(CGContextRef)context
{
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    
    // 保存当前绘图状态到绘图栈中，相当于push，但是路径是不能保存的
    CGContextSaveGState(context);
    
    // 画一条水平线
    CGContextMoveToPoint(context, 40.0, 20);
    CGContextAddLineToPoint(context, self.frame.size.width-80, 20);

    CGContextSetLineWidth(context, self.width);
    CGContextSetLineCap(context, self.cap);
    CGContextStrokePath(context);
    
    
    // Restore the previous drawing state, and save it again.
    // 恢复绘图栈中的状态，相当于pop
    CGContextRestoreGState(context);
    CGContextSaveGState(context);
    
    CGContextMoveToPoint(context, 40, 130);
    CGContextAddLineToPoint(context, 160, 60);
    CGContextAddLineToPoint(context, 280, 130);
    
    // Set the line width & join for the join demo
    CGContextSetLineWidth(context, self.width);
    CGContextSetLineJoin(context, self.join);
    CGContextStrokePath(context);
    
    // Restore the previous drawing state.
    // 恢复绘制栈中的绘图状态
    CGContextRestoreGState(context);
    
    
    // If the stroke width is large enough, display the path that generated these lines
    if (self.width >= 4.0) // arbitrarily only show when the line is at least twice as wide as our target stroke
    {
        CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
        
        CGContextMoveToPoint(context, 40.0, 20);
        CGContextAddLineToPoint(context, self.frame.size.width-80, 20.0);
        
        CGContextMoveToPoint(context, 40.0, 130.0);
        CGContextAddLineToPoint(context, 160.0, 60);
        CGContextAddLineToPoint(context, 280.0, 130.0);
        
        CGContextSetLineWidth(context, 2.0);
        CGContextStrokePath(context);
    }
}


// 当设置值的时候，需要重新更新UI
-(void)setCap:(CGLineCap)cap
{
    if (cap != _cap) {
        _cap = cap;
        [self setNeedsDisplay];
    }
}
-(void)setJoin:(CGLineJoin)join
{
    if (join != _join) {
        _join = join;
        [self setNeedsDisplay];
    }
}
-(void)setWidth:(CGFloat)width
{
    if (width != _width) {
        _width = width;
        [self setNeedsDisplay];
    }
}

@end




@implementation QuartzDashView
{
    CGFloat _dashPattern[10];
    size_t  _dashCount;
}

-(void)setDashPhase:(CGFloat)dashPhase
{
    if (dashPhase != _dashPhase) {
        _dashPhase = dashPhase;
        [self setNeedsDisplay];
    }
}

-(void)setDashPattern:(CGFloat *)pattern count:(size_t)count
{
    if ((count != _dashCount) || memcmp(_dashPattern, pattern, sizeof(CGFloat) * count) != 0) {
        memcpy(_dashPattern, pattern, sizeof(CGFloat) * count);
        _dashCount = count;
        [self setNeedsDisplay];
    }
}

-(void)drawInContext:(CGContextRef)context
{
    // Drawing lines with a white stroke color
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
}

@end



































