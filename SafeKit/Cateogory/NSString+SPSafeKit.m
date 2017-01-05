//
//  NSString+SPSafeKit.m
//  SafeKit
//
//  Created by je_ffy on 2016/12/28.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "NSString+SPSafeKit.h"

@implementation NSString (SPSafeKit)
- (unichar)safe_characterAtIndex:(NSUInteger)index {
    if (index >= [self length]) {
        
        return 0;
    }
    
    return [self safe_characterAtIndex:index];
}

- (NSString *)safe_substringFromIndex:(NSUInteger)from {
    if (from >= [self length]) {
        
        return @"";
    }
    
    return [self safe_substringFromIndex:from];
    
}

- (NSString *)safe_substringToIndex:(NSUInteger)to {
    if (to >= [self length]) {
        
        return @"";
    }
    
    return [self safe_substringToIndex:to];
}

- (NSString *)safe_substringWithRange:(NSRange)range {
    if (range.location + range.length > [self length]) {
        
        return @"";
    }
    
    return [self safe_substringWithRange:range];
}

+ (void)openSafeKit {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        [self spSwizzlingMethod:@selector(safe_characterAtIndex:) tarClassString:@"__NSCFString" tarSel:@selector(characterAtIndex:)];
        [self spSwizzlingMethod:@selector(safe_substringFromIndex:) tarClassString:@"__NSCFString" tarSel:@selector(substringFromIndex:)];
        [self spSwizzlingMethod:@selector(safe_substringToIndex:) tarClassString:@"__NSCFString" tarSel:@selector(substringToIndex:)];
        [self spSwizzlingMethod:@selector(safe_substringWithRange:) tarClassString:@"__NSCFString" tarSel:@selector(substringWithRange:)];
    });
}

@end
