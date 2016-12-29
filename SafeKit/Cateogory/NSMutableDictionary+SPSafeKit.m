//
//  NSMutableDictionary+SPSafeKit.m
//  SafeKit
//
//  Created by je_ffy on 2016/12/28.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "NSMutableDictionary+SPSafeKit.h"

@implementation NSMutableDictionary (SPSafeKit)

- (void)safe_removeObjectForKey:(id)aKey {
    if (!aKey) {
        
        return;
    }
    
    [self safe_removeObjectForKey:aKey];
}

- (void)safe_setObject:(id)anObject forKey:(id <NSCopying>)aKey {
    if (!anObject || !aKey) {
        
        return;
    }

    [self safe_setObject:anObject forKey:aKey];
}

+(void)openSafeKit {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self spSwizzlingMethod:@selector(safe_removeObjectForKey:) tarClassString:@"__NSDictionaryM" tarSel:@selector(removeObjectForKey:)];
        [self spSwizzlingMethod:@selector(safe_setObject:forKey:) tarClassString:@"__NSDictionaryM" tarSel:@selector(setObject:forKey:)];

    });
}

@end
