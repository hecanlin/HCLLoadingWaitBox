//
//  HCLActivityView.m
//  HCLLoadingWaitBox
//
//  Created by 贺灿林 on 2020/9/21.
//  Copyright © 2020 贺灿林. All rights reserved.
//

#import "HCLActivityView.h"

@interface HCLActivityView ()

@property (strong, nonatomic) UIActivityIndicatorView *activityView;

@property (strong, nonatomic) UILabel *textLabel;

@property (strong, nonatomic) UIView *backgroundView;

@end

@implementation HCLActivityView

- (void)showActivityType:(enumHCLLoadingWaitBoxType)type text:(NSString *)text
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
    
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:eHCLLoadingWaitBoxTypeActivity == type? UIActivityIndicatorViewStyleLarge:UIActivityIndicatorViewStyleMedium];
    activity.color = [UIColor whiteColor];
    [_backgroundView addSubview:activity];
    _activityView = activity;
    [activity startAnimating];
    
    CGSize size = [label.text boundingRectWithSize:CGSizeMake(100, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size;
    if (type == eHCLLoadingWaitBoxTypeActivity) {
        _backgroundView.frame = CGRectMake(0, 0, 120, 120);
        _backgroundView.center = self.center;
        _activityView.frame = CGRectMake(0, 0, 120, 120);
        _textLabel.hidden = YES;
    } else if (type == eHCLLoadingWaitBoxTypeActivityTopText) {
        _backgroundView.frame = CGRectMake(0, 0, 120, 90 + size.height);
        _backgroundView.center = self.center;
        _textLabel.frame = CGRectMake(10, 23, 100, size.height+2);
        _activityView.frame = CGRectMake(35, size.height+25, 50, 50);
    } else if (type == eHCLLoadingWaitBoxTypeActivityBottomText) {
        _backgroundView.frame = CGRectMake(0, 0, 120, 90 + size.height);
        _backgroundView.center = self.center;
        _activityView.frame = CGRectMake(35, 20, 50, 50);
        _textLabel.frame = CGRectMake(10, 70, 100, size.height+2);
    }
}

- (void)hiddenActivity
{
    [_backgroundView removeFromSuperview];
    [_textLabel removeFromSuperview];
    [_activityView stopAnimating];
    [_activityView removeFromSuperview];
    [self removeFromSuperview];
}

@end
