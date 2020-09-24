//
//  HCLActivityView.h
//  HCLLoadingWaitBox
//
//  Created by 贺灿林 on 2020/9/21.
//  Copyright © 2020 贺灿林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCLEnumDefine.h"

@interface HCLActivityView : UIView

- (void)showActivityType:(enumHCLLoadingWaitBoxType)type text:(NSString *)text;

- (void)hiddenActivity;

@end

