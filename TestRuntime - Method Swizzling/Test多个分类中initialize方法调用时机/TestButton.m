//
//  TestButton.m
//  Test多个分类中initialize方法调用时机
//
//  Created by XL on 2017/6/15.
//  Copyright © 2017年 CoderXL. All rights reserved.
//

#import "TestButton.h"
#import "NSObject+MethodSwizzling.h"

@implementation TestButton

+ (void)initialize
{
    NSLog(@"%@ initialize",[self class]);
}

+ (void)load
{
    NSLog(@"%@ load",[self class]);
    [self xl_exchangeInstanceMethod1:@selector(xl_dealloc) method2:NSSelectorFromString(@"dealloc")];
}

- (void)xl_dealloc
{
    NSLog(@"TestButton %s",__func__);
    [self xl_dealloc];
}

- (void)testButtonLog
{
    NSLog(@"TestButton %s",__func__);
}

@end
