//
//  CalculateFactory.h
//  DesignPatternDemo
//
//  Created by 魏信洋 on 2017/8/18.
//  Copyright © 2017年 com.allen. All rights reserved.
//  目的是返回需要计算的具体操作实例

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CalculateSign) {
    CalculateSignAdd,
    CalculateSignMinus,
    CalculateSignMulti,
    CalculateSignDivision
};

@interface CalculateFactory : NSObject
//通过switch的方式进行返回
+ (id)calculateOperaionWithSign:(CalculateSign)sign;
//通过反射的方式进行返回
+ (id)calculateOperaionWithOperationName:(NSString *)operationName;
@end
