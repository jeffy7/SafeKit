//
//  NSObject+SPSwizzling.m
//  SafeKit
//
//  Created by je_ffy on 2016/12/28.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "NSObject+SPSwizzling.h"

@implementation NSObject (SPSwizzling)

+ (void)spSwizzlingMethod:(SEL)systemSel tarSel:(SEL)tarSel {
    Class class = [self class];
    [self spSwizzlingMethod:systemSel tarClass:class tarSel:tarSel];
}

+ (void)spSwizzlingMethod:(SEL)systemSel tarClassString:(NSString *)tarClassString tarSel:(SEL)tarSel {
    Class tarClass = NSClassFromString(tarClassString);
    [self spSwizzlingMethod:systemSel tarClass:tarClass tarSel:tarSel];
}

+ (void)spSwizzlingMethod:(SEL)systemSel tarClass:(Class)tarClass tarSel:(SEL)tarSel {
    Class systemClass = [self class];
    [self spSwizzlingMethod:systemClass systemSel:systemSel tarClass:tarClass tarSel:tarSel];
}

+ (void)spSwizzlingMethod:(Class)systemClass systemSel:(SEL)systemSel tarClass:(Class)tarClass tarSel:(SEL)tarSel {
    if (!systemClass || !systemClass || !tarClass || !tarSel) {
        return;
    }
    
    Method systemMethod = class_getInstanceMethod(tarClass, systemSel);
    Method tarMethod = class_getInstanceMethod(tarClass, tarSel);
    
    method_exchangeImplementations(systemMethod, tarMethod);
    
}

@end
