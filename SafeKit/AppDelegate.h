//
//  AppDelegate.h
//  SafeKit
//
//  Created by je_ffy on 2016/12/28.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define GlobalApp (AppDelagate *)[UIApplication sharedApplication].delegate


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UINavigationController *rootController;


@end

