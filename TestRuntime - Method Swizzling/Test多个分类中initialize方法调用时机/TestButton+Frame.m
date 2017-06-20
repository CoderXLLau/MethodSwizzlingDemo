//
//  TestButton+Frame.m
//  Test多个分类中initialize方法调用时机
//
//  Created by XL on 2017/6/19.
//  Copyright © 2017年 CoderXL. All rights reserved.
//

#import "TestButton+Frame.h"

@implementation TestButton (Frame)

+ (void)load
{
    NSLog(@"Frame %@ load",[self class]);
}

+ (void)initialize
{
    NSLog(@"Frame %@ initialize",[self class]);
}

@end
