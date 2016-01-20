//
//  ViewController.m
//  ChatDemo
//
//  Created by youye on 16/1/21.
//  Copyright © 2016年 youye. All rights reserved.
//

#import "ViewController.h"
#import "ChatLineView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ChatLineView *sport = [[ChatLineView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 200)];
    
    [self.view addSubview:sport];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
