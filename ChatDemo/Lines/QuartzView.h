//
//  QuartzView.h
//  DrawDemo
//
//  Created by mac on 16/3/16.
//  Copyright © 2016年 mac. All rights reserved.
//

//  绘图的基础类
#import <UIKit/UIKit.h>

@interface QuartzView : UIView

// 所有绘图的类的基础类
-(void)drawInContext:(CGContextRef)context;

@end
