//
//  NSDictionary+SPSafeKit.m
//  SafeKit
//
//  Created by je_ffy on 2016/12/28.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "NSDictionary+SPSafeKit.h"

@implementation NSDictionary (SPSafeKit)

- (instancetype)safe_initWithObjects:(id)objects forKeys:(id)keys count:(NSUInteger)cnt {
    NSInteger count;
    for (NSInteger i = 0; i < cnt; i++) {
        if (!objects[i]) {
            objects[i] = @"";
            [[SPSafeKitManger shareInstsnce] dosomething];
            
            break;
        }else if (!keys) {
            keys = @"";
            [[SPSafeKitManger shareInstsnce] dosomething];
            
            break;
        }
        count ++;
    }
    
    return [self safe_initWithObjects:objects forKeys:keys count:count];
}

+ (void)openSafeKit {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self spSwizzlingMethod:@selector(safe_initWithObjects:forKeys:count:) tarClassString:@"__NSPlacehloderDictionary" tarSel:@selector(safe_initWithObjects:forKeys:count:)];
        
    });
}

@end
