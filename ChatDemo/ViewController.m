//
//  ViewController.m
//  ChatDemo
//
//  Created by youye on 16/1/21.
//  Copyright © 2016年 youye. All rights reserved.
//

#import "ViewController.h"
#import "ChatLineView.h"
#import "ContextDraw.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat width = self.view.frame.size.width;
    ChatLineView *sport = [[ChatLineView alloc] initWithFrame:CGRectMake(0, 60, width, 200)];
    [self.view addSubview:sport];
    
    ContextDraw *contextDraw = [[ContextDraw alloc] initWithFrame:CGRectMake(0, 300, width, 100)];
    contextDraw.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:contextDraw];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
