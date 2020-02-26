//
//  UIButton+SingleButtonAction.h
//  ButtonSingleClicked
//
//  Created by dbl on 2020/2/26.
//  Copyright © 2020 dbl. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (SingleButtonAction)
@property (nonatomic,assign) NSTimeInterval eventInterval;
@property (nonatomic,assign) NSTimeInterval eventTime;
@end

NS_ASSUME_NONNULL_END
