//
//  NSNumber+SPSafeKit.m
//  SafeKit
//
//  Created by je_ffy on 2016/12/28.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "NSNumber+SPSafeKit.h"

@implementation NSNumber (SPSafeKit)

- (BOOL)safe_isEqualToNumber:(NSNumber *)number {
    if (!number) {

        return NO;
    }
    
    return [self safe_isEqualToNumber:number];
}

- (NSComparisonResult)safe_compare:(NSNumber *)number {
    if (!number) {
        
        return NSOrderedAscending;
    }
    
    return [self safe_compare:number];
}

+ (void)openSafeKit {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self spSwizzlingMethod:@selector(safe_isEqualToNumber:) tarClassString:@"__NSCFNumber" tarSel:@selector(isEqualToNumber:)];
        [self spSwizzlingMethod:@selector(safe_compare:) tarClassString:@"__NSCFNumber" tarSel:@selector(compare:)];
        
    });
}

@end
