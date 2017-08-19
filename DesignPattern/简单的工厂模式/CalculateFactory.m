//
//  CalculateFactory.m
//  DesignPatternDemo
//
//  Created by 魏信洋 on 2017/8/18.
//  Copyright © 2017年 com.allen. All rights reserved.
//

#import "CalculateFactory.h"
#import "Add.h"
#import "Minus.h"
#import "Multi.h"
#import "Division.h"
#import "CalculateOperation.h"

@implementation CalculateFactory

/*
    优点:返回实例明确,代码易读
    缺点:逻辑代码冗长,不利于维护
 */
+ (id)calculateOperaionWithSign:(CalculateSign)sign{
    
    CalculateOperation *operation = nil;
    switch (sign) {
        case CalculateSignAdd:
            operation = [[Add alloc] init];
            break;
        case CalculateSignMinus:
            operation = [[Minus alloc] init];
            break;
        case CalculateSignMulti:
            operation = [[Multi alloc] init];
            break;
        case CalculateSignDivision:
            operation = [[Division alloc] init];
            break;
    }
    return operation;
}

/*
 优点:不需要知道具体的类,和工厂类完全解耦
 缺点:代码易读性不高,并且需要添加判断语句
 */
+ (id)calculateOperaionWithOperationName:(NSString *)operationName{
    id operation = [[NSClassFromString(operationName) alloc] init];
    if (!operation) {
        NSException *exception = [NSException exceptionWithName:@"wrong operationName" reason:@"operationName must be right" userInfo:nil];
        @throw exception;
    }
    return operation;
}


@end
