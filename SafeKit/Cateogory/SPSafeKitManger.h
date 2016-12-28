//
//  SPSafeKitManger.h
//  SafeKit
//
//  Created by je_ffy on 2016/12/29.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPSafeKitManger : NSObject

+ (SPSafeKitManger *)shareInstsnce;

- (void)dosomething;
- (void)openSafeKit;

@end
