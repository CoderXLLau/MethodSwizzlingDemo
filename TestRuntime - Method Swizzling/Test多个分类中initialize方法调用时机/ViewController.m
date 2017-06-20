//
//  ViewController.m
//  Test多个分类中initialize方法调用时机
//
//  Created by XL on 2017/6/15.
//  Copyright © 2017年 CoderXL. All rights reserved.
//

#import "ViewController.h"

#import "TestButton.h"
#import "SubclassButton.h"
#import "SubclassButton+color.h"
#import "SubclassButton+border.h"
#import "TestButton+Frame.h"

@interface ViewController ()

@property (nonatomic , strong)SubclassButton *btn;
@property (nonatomic , strong)TestButton *testBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    {
        SubclassButton *btn = [[SubclassButton alloc] init];
        self.btn = btn;
        btn.frame = CGRectMake(100, 100, 100, 100);
        [self.view addSubview:btn];
        [btn setBorderWidth:3];
        [btn setColor:[UIColor redColor]];
    }
    
    {
        TestButton *btn = [[TestButton alloc] init];
        self.testBtn = btn;
        btn.frame = CGRectMake(100, 210, 100, 100);
        [self.view addSubview:btn];
    }
    
    /* 结论:
        分类和类自身都实现的initialize方法,会调用分类的initialize,不调用类自身的initialize
     
        load方法按照父类到子类,类自身到Category的顺序被调用
     */
    /*
     2017-06-19 18:00:06.550 Test多个分类中initialize方法调用时机[3939:130395] Frame TestButton initialize
     2017-06-19 18:00:06.551 Test多个分类中initialize方法调用时机[3939:130395] TestButton load
     2017-06-19 18:00:06.551 Test多个分类中initialize方法调用时机[3939:130395] color SubclassButton initialize
     2017-06-19 18:00:06.551 Test多个分类中initialize方法调用时机[3939:130395] SubclassButton SubclassButton load
     2017-06-19 18:00:22.651 Test多个分类中initialize方法调用时机[3939:130395] border  SubclassButton load
     2017-06-19 18:00:25.795 Test多个分类中initialize方法调用时机[3939:130395] color SubclassButton load
     2017-06-19 18:00:27.447 Test多个分类中initialize方法调用时机[3939:130395] Frame TestButton load
     */
    
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.btn testButtonLog];
    [self.testBtn testButtonLog];
}

@end
