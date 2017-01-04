//
//  ViewController.m
//  SafeKit
//
//  Created by je_ffy on 2016/12/28.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *atr = nil;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:atr];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"test" forState:UIControlStateNormal];
    button.sp_acceptEventInterval = 1.0f;
    [button addTarget:self action:@selector(logButtonTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)logButtonTap {
    NSLog(@"UIButton tap");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
