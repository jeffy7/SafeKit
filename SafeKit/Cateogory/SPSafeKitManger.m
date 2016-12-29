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
    //日志上传
    //弹框提示
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Notice" message:@"Reason" preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"~~~~~~~~~~~");
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"~~~~~~~~~~~");
    }]];
    
    
    UINavigationController *rootNav = [(AppDelegate *)[UIApplication sharedApplication].delegate rootController];
    [rootNav presentViewController:alertVC animated:YES completion:^{
        
    }];

    
}

- (void)openSafeKit {
    [NSString openSafeKit];
    [NSArray openSafeKit];
    [NSDictionary openSafeKit];
    [NSMutableString openSafeKit];
    [NSMutableArray openSafeKit];
    [NSMutableDictionary openSafeKit];
    [NSNumber openSafeKit];
}

@end
