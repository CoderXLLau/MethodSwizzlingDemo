//
//  SubclassButton+border.m
//  Test多个分类中initialize方法调用时机
//
//  Created by XL on 2017/6/15.
//  Copyright © 2017年 CoderXL. All rights reserved.
//

#import "SubclassButton+border.h"

@implementation SubclassButton (border)

+ (void)initialize
{
    NSLog(@"border %@ initialize",[self class]);
}

+ (void)load
{
    NSLog(@"border  %@ load",[self class]);
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = borderWidth;
}

@end
