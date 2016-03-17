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

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    UITableView     *_tableView;
    NSMutableArray  *_dataList;
    
    NSMutableArray  *_pushVCList;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataList = [[NSMutableArray alloc] initWithObjects:@"Line", nil];
    _pushVCList = [[NSMutableArray alloc] initWithObjects:@"LineViewController", nil];
    
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = _dataList[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[NSClassFromString(_pushVCList[indexPath.row]) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    
//    CGFloat width = self.view.frame.size.width;
//    ChatLineView *sport = [[ChatLineView alloc] initWithFrame:CGRectMake(0, 60, width, 200)];
//    [self.view addSubview:sport];
//    
//    ContextDraw *contextDraw = [[ContextDraw alloc] initWithFrame:CGRectMake(0, 300, width, 100)];
//    contextDraw.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:contextDraw];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
