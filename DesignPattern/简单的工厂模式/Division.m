//
//  Division.m
//  DesignPatternDemo
//
//  Created by 魏信洋 on 2017/8/18.
//  Copyright © 2017年 com.allen. All rights reserved.
//

#import "Division.h"

@implementation Division

- (void)getResult{
    if (self.number2 == 0) return;
    NSLog(@"division result is %zd",(self.number1 / self.number2));
}

@end
