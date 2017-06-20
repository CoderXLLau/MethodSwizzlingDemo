//
//  TestButton.m
//  Test多个分类中initialize方法调用时机
//
//  Created by XL on 2017/6/15.
//  Copyright © 2017年 CoderXL. All rights reserved.
//

#import "TestButton.h"

@implementation TestButton

+ (void)initialize
{
    NSLog(@"%@ initialize",[self class]);
}

+ (void)load
{
    NSLog(@"%@ load",[self class]);
}

- (void)
{
    NSLog(@"TestButton %s",__func__);
}

@end
