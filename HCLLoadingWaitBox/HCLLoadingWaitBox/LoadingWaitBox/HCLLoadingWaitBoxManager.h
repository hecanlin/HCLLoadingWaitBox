//
//  HCLLoadingWaitBoxManager.h
//  HCLLoadingWaitBox
//
//  Created by 贺灿林 on 2020/9/21.
//  Copyright © 2020 贺灿林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HCLEnumDefine.h"

@interface HCLLoadingWaitBoxManager : NSObject

+ (instancetype)sharedInstance;

- (void)showLoadingWaitBoxWithType:(enumHCLLoadingWaitBoxType)type text:(NSString *)text;

- (void)hiddenLoadingWaitBox;

@end

