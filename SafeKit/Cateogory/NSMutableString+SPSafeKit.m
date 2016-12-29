//
//  NSMutableString+SPSafeKit.m
//  SafeKit
//
//  Created by je_ffy on 2016/12/28.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "NSMutableString+SPSafeKit.h"

@implementation NSMutableString (SPSafeKit)

- (void)safe_appendString:(NSString *)aString {
    if (!aString) {
        
        return;
    }
    
    [self safe_appendString:aString];
}

- (void)safe_appendFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) {
    if (!format) {
        
        return;
    }
    va_list arguments;
    va_start(arguments, format);
    NSString *formatStr = [[NSString alloc] initWithFormat:format arguments:arguments];
    [self safe_appendFormat:@"%@",formatStr];
    va_end(arguments);
}

- (void)safe_setString:(NSString *)aString {
    if (!aString) {

        return;
    }
    
    [self safe_setString:aString];
}

- (void)safe_insertString:(NSString *)aString atIndex:(NSUInteger)index {
    if (index > [self length] || !aString) {
        
        return;
    }
    
    [self safe_insertString:aString atIndex:index];
}

+(void)openSafeKit {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self spSwizzlingMethod:@selector(safe_appendString:) tarClassString:@"__NSCFConstantString" tarSel:@selector(appendString:)];
        [self spSwizzlingMethod:@selector(safe_appendFormat:) tarClassString:@"__NSCFConstantString" tarSel:@selector(appendFormat:)];
        [self spSwizzlingMethod:@selector(safe_setString:) tarClassString:@"__NSCFConstantString" tarSel:@selector(setString:)];
        [self spSwizzlingMethod:@selector(safe_insertString:atIndex:) tarClassString:@"__NSCFConstantString" tarSel:@selector(insertObject:atIndex:)];
        
    });
}

@end



