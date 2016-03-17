//
//  QuartzLinesView.h
//  DrawDemo
//
//  Created by mac on 16/3/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QuartzView.h"

// 绘制线
@interface QuartzLinesView : QuartzView

@end



// 绘制控制笔两段、拐角和宽度
@interface QuartzCapJoinWidthView : QuartzView

@property (nonatomic, assign) CGLineCap    cap;
@property (nonatomic, assign) CGLineJoin   join;
@property (nonatomic, assign) CGFloat      width;

@end



// 绘制虚线
@interface QuartzDashView : QuartzView

@property (nonatomic, assign) CGFloat dashPhase;

-(void)setDashPattern:(CGFloat *)pattern count:(size_t)count;

@end