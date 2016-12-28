//
//  SPSafeKitManger.m
//  SafeKit
//
//  Created by je_ffy on 2016/12/29.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "SPSafeKitManger.h"

static SPSafeKitManger *safekitManger = nil;

@implementation SPSafeKitManger

#pragma mark -
#pragma mark - Singleton
+ (SPSafeKitManger *)shareInstsnce {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        safekitManger = [[[self class] alloc] init];
    });
    
    return safekitManger;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        safekitManger = [super allocWithZone:zone];
    });
    
    return safekitManger;
}

- (void)dosomething {
    
}

- (void)openSafeKit {
    
}

@end
