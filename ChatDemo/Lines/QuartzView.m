//
//  QuartzView.m
//  DrawDemo
//
//  Created by mac on 16/3/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QuartzView.h"

@implementation QuartzView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 这样就不必须要多个地方写UIGraphicsGetCurrentContext 了
    [self drawInContext:UIGraphicsGetCurrentContext()];
}


/*
 Common view properties are set in the storyboard.
 backgroundColor = [UIColor blackColor];
 opaque = YES;
 clearsContextBeforeDrawing = YES;
 */

/*
 Because we use the CGContext a lot, it is convienient for our demonstration classes to do the real work inside of a method that passes the context as a parameter, rather than having to query the context continuously, or setup that parameter for every subclass.
 */
-(void)drawInContext:(CGContextRef)context
{
    // code in here ...
}


@end
