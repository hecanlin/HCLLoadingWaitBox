//
//  HCLPointView.m
//  HCLLoadingWaitBox
//
//  Created by 贺灿林 on 2020/9/22.
//  Copyright © 2020 贺灿林. All rights reserved.
//

#import "HCLPointView.h"

@interface HCLPointView ()

@property (strong, nonatomic) UILabel *textLabel;

@property (strong, nonatomic) UIView *backgroundView;

@property (strong, nonatomic) NSTimer *timer;

@property (copy,   nonatomic) NSArray *viewArray;

@property (assign, nonatomic) NSInteger changTimes;

@end

@implementation HCLPointView

- (void)showPointType:(enumHCLLoadingWaitBoxType)type text:(NSString *)text
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    view.layer.cornerRadius = 20;
    [self addSubview:view];
    _backgroundView = view;
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    [_backgroundView addSubview:label];
    _textLabel = label;
    
    CGSize size = [label.text boundingRectWithSize:CGSizeMake(100, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size;
    NSInteger height = 57;
    if (type == eHCLLoadingWaitBoxTypePoint) {
        _backgroundView.frame = CGRectMake(0, 0, 120, 120);
        _backgroundView.center = self.center;
        _textLabel.hidden = YES;
    } else if (type == eHCLLoadingWaitBoxTypePointTopText) {
        _backgroundView.frame = CGRectMake(0, 0, 120, 90 + size.height);
        _backgroundView.center = self.center;
        _textLabel.frame = CGRectMake(10, 23, 100, size.height+2);
        height = size.height + 42;
    }
    
    NSMutableArray *marray = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30 + 15*i, height, 6, 6)];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.cornerRadius = 3;
        [_backgroundView addSubview:view];
        [marray addObject:view];
    }
    self.viewArray = marray;
    self.changTimes = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:.3 target:self selector:@selector(repeatsChangeView) userInfo:nil repeats:YES];
}

- (void)repeatsChangeView
{
    self.changTimes ++;
    for (int i=0; i<self.viewArray.count; i++) {
        UIView *view = [self.viewArray objectAtIndex:i];
        if (i < self.changTimes%5) {
            view.backgroundColor = [UIColor orangeColor];
        } else {
            view.backgroundColor = [UIColor whiteColor];
        }
    }
}

- (void)hiddenPoint
{
    [self.timer invalidate];
    [_backgroundView removeFromSuperview];
    [_textLabel removeFromSuperview];
    [self removeFromSuperview];
}

@end
