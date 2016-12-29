//
//  NSMutableArray+SPSafeKit.m
//  SafeKit
//
//  Created by je_ffy on 2016/12/28.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "NSMutableArray+SPSafeKit.h"

@implementation NSMutableArray (SPSafeKit)

- (void)safe_addObject:(id)object {
    if (!object) {
        [[SPSafeKitManger shareInstsnce] dosomething];
        return;
    }
    
    return [self safe_addObject:object];
}

- (void)safe_removeObject:(id)object {
    if (!object) {
        
        return;
    }
    
    return [self safe_removeObject:object];
}

- (void)safe_removeObjectAtIndex:(NSUInteger)objectIndex {
    if (objectIndex >= [self count]) {
        
        return;
    }
    
    return [self safe_removeObjectAtIndex:objectIndex];
}

- (void)safe_insertObject:(id)anObject atIndex:(NSUInteger)objectIndex {
    if (objectIndex > [self count] || !anObject) {
        
        return;
    }
    
    return [self safe_insertObject:anObject atIndex:objectIndex];
}

- (void)safe_replaceObjectAtIndex:(NSUInteger)objectIndex withObject:(id)anObject {
    if (objectIndex >= [self count] || !anObject) {
        
        return;
    }
    
    return [self safe_replaceObjectAtIndex:objectIndex withObject:anObject];
}

+ (void)openSafeKit {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self spSwizzlingMethod:@selector(safe_addObject:) tarClassString:@"__NSArrayM" tarSel:@selector(addObject:)];
        [self spSwizzlingMethod:@selector(safe_removeObject:) tarClassString:@"__NSArrayM" tarSel:@selector(removeObject:)];
        [self spSwizzlingMethod:@selector(safe_removeObjectAtIndex:) tarClassString:@"__NSArrayM" tarSel:@selector(removeObject:)];
        [self spSwizzlingMethod:@selector(safe_insertObject:atIndex:) tarClassString:@"__NSArrayM" tarSel:@selector(insertObject:atIndex:)];
        [self spSwizzlingMethod:@selector(safe_replaceObjectAtIndex:withObject:) tarClassString:@"__NSArrayM" tarSel:@selector(replaceObjectAtIndex:withObject:)];
    });
}

@end
