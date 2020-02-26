//
//  UIButton+SingleButtonAction.m
//  ButtonSingleClicked
//
//  Created by dbl on 2020/2/26.
//  Copyright © 2020 dbl. All rights reserved.
//

#import "UIButton+SingleButtonAction.h"
#import <objc/runtime.h>


@implementation UIButton (SingleButtonAction)

static const char * UIControlEventInterval = "UIControlEventinterval";
- (NSTimeInterval)eventInterval {
    return [objc_getAssociatedObject(self, UIControlEventInterval) doubleValue];
}

- (void)setEventInterval:(NSTimeInterval)eventInterval {
    objc_setAssociatedObject(self, UIControlEventInterval, @(eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static const char *UIControlEventTime = "UIControlEventTime";
- (NSTimeInterval)eventTime {
    return [objc_getAssociatedObject(self, UIControlEventTime) doubleValue];
}

- (void)setEventTime:(NSTimeInterval)eventTime {
    objc_setAssociatedObject(self, UIControlEventTime, @(eventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load {
    Method before = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method after = class_getInstanceMethod(self, @selector(dbl_SendAction:to:forEvent:));
    method_exchangeImplementations(before, after);
}

- (void)dbl_SendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([NSDate date].timeIntervalSince1970 - self.eventTime < self.eventInterval) {
        return;
    }
    if (self.eventInterval > 0) {
        self.eventTime = [NSDate date].timeIntervalSince1970;
    }
    
    [self dbl_SendAction:action to:target forEvent:event];
}

@end
