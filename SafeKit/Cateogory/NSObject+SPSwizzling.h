//
//  NSObject+SPSwizzling.h
//  SafeKit
//
//  Created by je_ffy on 2016/12/28.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SPSwizzling)

+ (void)spSwizzlingMethod:(SEL)systemSel tarSel:(SEL)tarSel;
+ (void)spSwizzlingMethod:(SEL)systemSel tarClassString:(NSString *)tarClassString tarSel:(SEL)tarSel;
+ (void)spSwizzlingMethod:(SEL)systemSel tarClass:(Class)tarClass tarSel:(SEL)tarSel;
+ (void)spSwizzlingMethod:(Class)systemClass systemSel:(SEL)systemSel tarClass:(Class)tarClass tarSel:(SEL)tarSel;

@end
