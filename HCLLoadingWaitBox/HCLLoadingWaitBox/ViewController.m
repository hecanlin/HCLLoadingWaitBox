//
//  ViewController.m
//  HCLLoadingWaitBox
//
//  Created by 贺灿林 on 2020/9/21.
//  Copyright © 2020 贺灿林. All rights reserved.
//

#import "ViewController.h"
#import "HCLLoadingWaitBoxManager.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataArray = @[
        @{@"title":@"转圈圈等待", @"type":@(eHCLLoadingWaitBoxTypeActivity)},
        @{@"title":@"文字加转圈圈等待", @"type":@(eHCLLoadingWaitBoxTypeActivityTopText), @"text":@"loading……"},
        @{@"title":@"转圈圈加文字等待", @"type":@(eHCLLoadingWaitBoxTypeActivityBottomText), @"text":@"loading……"},
        @{@"title":@"点点加载等待", @"type":@(eHCLLoadingWaitBoxTypePoint)},
        @{@"title":@"点点加文字等待", @"type":@(eHCLLoadingWaitBoxTypePointTopText), @"text":@"loading……"},
        @{@"title":@"彩色旋转等待", @"type":@(eHCLLoadingWaitBoxTypeColorRotation)},
    ];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentifer"];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifer" forIndexPath:indexPath];
    cell.textLabel.text = [self.dataArray[indexPath.row] objectForKey:@"title"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = [self.dataArray[indexPath.row] objectForKey:@"text"];
    NSInteger type = [[self.dataArray[indexPath.row] objectForKey:@"type"] integerValue];
    [[HCLLoadingWaitBoxManager sharedInstance] showLoadingWaitBoxWithType:type text:text];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[HCLLoadingWaitBoxManager sharedInstance] hiddenLoadingWaitBox];
    });
}

@end
