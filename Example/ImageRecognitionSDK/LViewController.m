//
//  LViewController.m
//  ImageRecognitionSDK
//
//  Created by ag970898664@163.com on 12/04/2018.
//  Copyright (c) 2018 ag970898664@163.com. All rights reserved.
//
#import "XLEDeliveryStringJudge.h"
#import "LViewController.h"

@interface LViewController ()

@end

@implementation LViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if ([XLEDeliveryStringJudge stringIsBlank:@"123456"]) {
        //是空
        NSLog(@"YES");
    }
    else{
        //非空
        NSLog(@"NO");
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
