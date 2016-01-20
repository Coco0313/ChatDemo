//
//  SportStepTableView.m
//  SportStepTableDemo
//
//  Created by mac on 16/1/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ChatLineView.h"

@interface ChatLineView ()

@property (nonatomic,assign) NSUInteger     tableHours;
@property (nonatomic,assign) CGFloat        leftSpace;
@property (nonatomic,assign) CGFloat        rightSpace;
@property (nonatomic,assign) CGFloat        hourSpace;
@property (nonatomic,assign) CGFloat        hourWidth;  //计算所得

@property (nonatomic,assign) CGFloat        painWidth;

@property (nonatomic,strong) UIView         *backgroundView;

@property (nonatomic,strong) NSMutableArray *pointArray;

@property (nonatomic,strong) CAShapeLayer   *lineLayer;
@property (nonatomic,strong) UIView         *tapView;

@end

@implementation ChatLineView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.tableHours = 24;
        self.leftSpace = 10;
        self.rightSpace = 10;
        self.hourSpace = 0;
        
        self.painWidth = 25;
        
        self.hourWidth = (frame.size.width-_leftSpace-_rightSpace-_hourSpace*(_tableHours-1))/_tableHours;
        

        [self setDefaultValues];

        self.backgroundColor = [UIColor purpleColor];
        
        self.lineLayer = [CAShapeLayer layer];
        self.lineLayer.frame = CGRectMake(_leftSpace, 0, 1, self.frame.size.height);
        self.lineLayer.backgroundColor = [UIColor purpleColor].CGColor;
        [self.layer addSublayer:self.lineLayer];
        
        self.tapView = [[UIView alloc] initWithFrame:CGRectMake(0,self.frame.size.height-50, 50, 50)];
        self.tapView.backgroundColor = [UIColor orangeColor];
        self.tapView.userInteractionEnabled = YES;
        [self addSubview:self.tapView];
        
    }
    return self;
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    self.tapView.center = touchPoint;
    
    CGRect rect = _lineLayer.frame;
    rect.origin.x = touchPoint.x;
    self.lineLayer.frame = rect;
}



-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawBackgroundLine:context valuesArray:_hightArray];
    [self drawBackgroundLine:context valuesArray:_lowArray];
    
    [self drawLine:context valuesArray:_hightArray];
    [self drawLine:context valuesArray:_lowArray];
    
    [self drawPoint:context valuesArray:_hightArray];
    [self drawPoint:context valuesArray:_lowArray];
    
}


-(void)setDefaultValues
{
    self.hightArray = [[NSMutableArray alloc] initWithCapacity:_tableHours];
    self.lowArray = [[NSMutableArray alloc] initWithCapacity:_tableHours];
    self.pointArray = [[NSMutableArray alloc] initWithCapacity:_tableHours];
    for (NSUInteger i=0; i<_tableHours; i++) {
        
        NSUInteger value = arc4random()%50+130;
        [_hightArray addObject:@(value)];
        
        NSUInteger value2 = arc4random()%30+100;
        [_lowArray addObject:@(value2)];
    }
}


// 画背景线
-(void)drawBackgroundLine:(CGContextRef)context valuesArray:(NSMutableArray *)valuesArray
{
    // 设置
    CGContextSetLineWidth(context, self.painWidth);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    [[UIColor lightGrayColor] set];

    for (NSUInteger i=0; i<valuesArray.count; i++) {
        
        NSNumber *value = valuesArray[i];
        
        CGFloat x = _leftSpace + (_hourWidth+_hourSpace)*i;
        CGFloat y = self.frame.size.height-value.floatValue;
        
        if (i==0) {
            CGContextMoveToPoint(context, x, y);
        } else {
            CGContextAddLineToPoint(context, x, y);
        }
    }
    CGContextStrokePath(context);
}

-(void)drawLine:(CGContextRef)context valuesArray:(NSMutableArray *)valuesArray
{
    CGMutablePathRef path = CGPathCreateMutable();
    for (NSUInteger i=0; i<valuesArray.count; i++) {
        
        NSNumber *value = valuesArray[i];
        
        CGFloat x = _leftSpace + (_hourSpace+_hourWidth)*i;
        CGFloat y = self.frame.size.height-value.floatValue;
        
        if (i==0) {
            CGPathMoveToPoint(path, NULL, x, y);
        } else {
            CGPathAddLineToPoint(path, NULL, x, y);
        }
    }
    
    CGContextSetLineWidth(context, 1);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinBevel);
    [[UIColor blueColor] set];
    
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
}

-(void)drawPoint:(CGContextRef)context valuesArray:(NSMutableArray *)valuesArray
{
    // 设置
    CGContextSetLineWidth(context, 5);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    [[UIColor whiteColor] set];
    
    for (NSUInteger i=0; i<valuesArray.count; i++) {
        
        NSNumber *value = valuesArray[i];
        
        CGFloat x = _leftSpace + (_hourWidth+_hourSpace)*i;
        CGFloat y = self.frame.size.height-value.floatValue;
        
        CGContextMoveToPoint(context, x, y);
        CGContextAddLineToPoint(context, x, y);
    }
    CGContextStrokePath(context);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
