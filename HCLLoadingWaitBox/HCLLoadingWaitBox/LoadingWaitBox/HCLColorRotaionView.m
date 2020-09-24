//
//  HCLColorRotaionView.m
//  HCLLoadingWaitBox
//
//  Created by 贺灿林 on 2020/9/22.
//  Copyright © 2020 贺灿林. All rights reserved.
//

#import "HCLColorRotaionView.h"

@interface HCLColorRotaionView ()

@property (strong, nonatomic) UIView *backgroundView;

@property (strong, nonatomic) NSTimer *timer;

@property (copy,   nonatomic) NSArray *viewArray;

@property (assign, nonatomic) NSInteger changTimes;

@property (copy,   nonatomic) NSArray *pointArray;

@property (copy,   nonatomic) NSArray *colorArray;

@end

@implementation HCLColorRotaionView

- (void)showColorRotationView
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor grayColor];
    view.layer.cornerRadius = 20;
    [self addSubview:view];
    _backgroundView = view;
    _backgroundView.frame = CGRectMake(0, 0, 120, 120);
    _backgroundView.center = self.center;
    
    self.pointArray = @[
        @{@"x":@(60), @"y":@(33)},
        @{@"x":@(76), @"y":@(42)},
        @{@"x":@(87), @"y":@(60)},
        @{@"x":@(76), @"y":@(78)},
        @{@"x":@(60), @"y":@(87)},
        @{@"x":@(42), @"y":@(79)},
        @{@"x":@(33), @"y":@(60)},
        @{@"x":@(42), @"y":@(42)}
    ];
    self.colorArray = @[[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor cyanColor], [UIColor blueColor], [UIColor purpleColor], [UIColor whiteColor]];
    
    NSMutableArray *marray = [NSMutableArray array];
    for (int i=0; i<8; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2*i+3, 2*i+3)];
        view.backgroundColor = self.colorArray[i];
        view.layer.cornerRadius = view.bounds.size.height/2.0;
        NSInteger x = [[[self.pointArray objectAtIndex:i] objectForKey:@"x"] integerValue];
        NSInteger y = [[[self.pointArray objectAtIndex:i] objectForKey:@"y"] integerValue];
        view.center = CGPointMake(x, y);
        [_backgroundView addSubview:view];
        [marray addObject:view];
    }
    self.viewArray = marray;
    self.changTimes = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(repeatsChangeView) userInfo:nil repeats:YES];
}

- (void)repeatsChangeView
{
    self.changTimes ++;
    for (int i=0; i<self.viewArray.count; i++) {
        UIView *view = [self.viewArray objectAtIndex:i];
        NSInteger side = (i*2 + self.changTimes*2) % 16 + 3;
        NSInteger x = [[[self.pointArray objectAtIndex:i] objectForKey:@"x"] integerValue];
        NSInteger y = [[[self.pointArray objectAtIndex:i] objectForKey:@"y"] integerValue];
        view.frame = CGRectMake(x - side/2, y - side/2, side, side);
        view.layer.cornerRadius = view.bounds.size.height/2.0;
        view.backgroundColor = [self.colorArray objectAtIndex:(i+self.changTimes)%self.colorArray.count];
    }
}

- (void)hiddenColorRotationView
{
    [self.timer invalidate];
    [_backgroundView removeFromSuperview];
    [self removeFromSuperview];
}

@end
