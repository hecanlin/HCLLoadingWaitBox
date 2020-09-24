//
//  HCLPointView.h
//  HCLLoadingWaitBox
//
//  Created by 贺灿林 on 2020/9/22.
//  Copyright © 2020 贺灿林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCLEnumDefine.h"

@interface HCLPointView : UIView

- (void)showPointType:(enumHCLLoadingWaitBoxType)type text:(NSString *)text;

- (void)hiddenPoint;

@end

