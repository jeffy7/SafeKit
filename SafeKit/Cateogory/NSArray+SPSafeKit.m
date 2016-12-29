//
//  NSArray+SPSafeKit.m
//  SafeKit
//
//  Created by je_ffy on 2016/12/28.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "NSArray+SPSafeKit.h"

@implementation NSArray (SPSafeKit)

- (instancetype)safe_initWithObjects:(id)objects count:(NSUInteger)cnt {
    NSInteger count;
    for (NSInteger i = 0; i < cnt; i++) {
        if (!objects[i]) {
            [[SPSafeKitManger shareInstsnce] dosomething];
            
            break;
        }
        count ++;
    }
    
    return [self safe_initWithObjects:objects count:count];
}

- (id)safe_objectAtIndex:(NSUInteger)objectIndex {
    if (objectIndex >= [self count]) {
        
        return nil;
    }
    
    return [self safe_objectAtIndex:objectIndex];
}

- (NSArray *)safe_arrayByAddingObject:(id)anObject {
    if (!anObject) {
        [[SPSafeKitManger shareInstsnce] dosomething];
        
        return self;
    }
    
    return [self safe_arrayByAddingObject:anObject];
}

+ (void)openSafeKit {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self spSwizzlingMethod:@selector(safe_initWithObjects:count:) tarClassString:@"__NSPlaceholderArray" tarSel:@selector(initWithValues:count:)];
        [self spSwizzlingMethod:@selector(safe_objectAtIndex:) tarClassString:@"__NSArrayI" tarSel:@selector(objectAtIndex:)];
        [self spSwizzlingMethod:@selector(safe_arrayByAddingObject:) tarClassString:@"__NSArrayI" tarSel:@selector(arrayWithObject:)];
        
        });
}

@end





