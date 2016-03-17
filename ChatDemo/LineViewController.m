//
//  LineViewController.m
//  DrawDemo
//
//  Created by mac on 16/3/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "LineViewController.h"
#import "QuartzLinesView.h"

@interface LineViewController ()

@property (nonatomic,strong) QuartzLinesView        *linesView;

@property (nonatomic,strong) UIView                 *capJoinWithBackgroundView;
@property (nonatomic,strong) QuartzCapJoinWidthView *capJoinWithView;
@property (nonatomic,strong) UISegmentedControl     *capSegment;
@property (nonatomic,strong) UISegmentedControl     *joinSegment;
@property (nonatomic,strong) UISlider               *widthSlider;

@end

@implementation LineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _linesView = [[QuartzLinesView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 100)];
    [self.view addSubview:_linesView];
    
    [self setCapJoinWithBackgroundView];
}

-(void)setCapJoinWithBackgroundView
{
    _capJoinWithBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 180, self.view.frame.size.width, 300)];
    _capJoinWithBackgroundView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_capJoinWithBackgroundView];
    
    _capJoinWithView = [[QuartzCapJoinWidthView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    [_capJoinWithBackgroundView addSubview:_capJoinWithView];
    
    _capSegment = [[UISegmentedControl alloc] initWithItems:@[@"CapButt", @"CapRound" ,@"CapSquare"]];
    _capSegment.frame = CGRectMake(40, 180, self.view.frame.size.width-80, 20);
    [_capSegment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    _capSegment.tag = 100;
    [_capJoinWithBackgroundView addSubview:_capSegment];
    _capSegment.selectedSegmentIndex = 0;
    
    _joinSegment = [[UISegmentedControl alloc] initWithItems:@[@"JoinMiter", @"JoinRound" ,@"JoinBevel"]];
    _joinSegment.frame = CGRectMake(40, 220, self.view.frame.size.width-80, 20);
    [_joinSegment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    _joinSegment.selectedSegmentIndex = 0;
    _joinSegment.tag = 101;
    [_capJoinWithBackgroundView addSubview:_joinSegment];
    
    _widthSlider = [[UISlider alloc] initWithFrame:CGRectMake(40, 270, self.view.frame.size.width-80, 20)];
    _widthSlider.maximumValue = 20;
    _widthSlider.minimumValue = 2;
    [_widthSlider addTarget:self action:@selector(widthAction) forControlEvents:UIControlEventValueChanged];
    [_capJoinWithBackgroundView addSubview:_widthSlider];
    
    [self segmentAction:_capSegment];
    [self segmentAction:_joinSegment];
}

-(void)segmentAction:(UISegmentedControl *)segment
{
    NSInteger selectIndex = segment.selectedSegmentIndex;
    switch (segment.tag) {
        case 100:
        {
            _capJoinWithView.cap = (selectIndex==0 ? kCGLineCapButt : (selectIndex == 1 ? kCGLineCapRound : kCGLineCapSquare));
            break;
        }
        case 101:
        {
            _capJoinWithView.join = (selectIndex==0 ? kCGLineJoinMiter : (selectIndex == 1 ? kCGLineJoinRound : kCGLineJoinBevel));
            break;
        }
    }
}
-(void)widthAction
{
    _capJoinWithView.width = _widthSlider.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
