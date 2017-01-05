//
//  UIButton+RepeatClick.m
//  SafeKit
//
//  Created by je_ffy on 2017/1/4.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "UIButton+RepeatClick.h"

@implementation UIButton (RepeatClick)

- (NSTimeInterval)sp_acceptEventInterval {
    
    return [objc_getAssociatedObject(self, @selector(sp_acceptEventInterval)) doubleValue];
}

- (void)setSp_acceptEventInterval:(NSTimeInterval)sp_acceptEventInterval {
    objc_setAssociatedObject(self, @selector(sp_acceptEventInterval), @(sp_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)sp_ignoreEvent {
    return objc_getAssociatedObject(self, @selector(sp_ignoreEvent));
}

- (void)setSp_ignoreEvent:(BOOL)sp_ignoreEvent {
    objc_setAssociatedObject(self, @selector(sp_ignoreEvent), @(sp_ignoreEvent), OBJC_ASSOCIATION_ASSIGN);
}

+ (void)load {
    Method systemMethod = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method tarMethod = class_getInstanceMethod(self, @selector(sp_sendAction:to:forEvent:));
    
    method_exchangeImplementations(systemMethod, tarMethod);
}

- (void)sp_sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    if (!self.enabled) return;
    
    if (self.sp_acceptEventInterval > 0) {
        self.enabled = NO;
        [self performSelector:@selector(changeEnable) withObject:nil afterDelay:self.sp_acceptEventInterval];
    }
    
    [self sp_sendAction:action to:target forEvent:event];
}

- (void)changeEnable {
    self.enabled = YES;
}


@end
