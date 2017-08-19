//
//  CalculateOperation.h
//  DesignPatternDemo
//
//  Created by 魏信洋 on 2017/8/18.
//  Copyright © 2017年 com.allen. All rights reserved.
//  定义一个抽象类,包含了子类需要的参数和需要实现的逻辑方法

#import <Foundation/Foundation.h>

@interface CalculateOperation : NSObject

/**
 *  number1
 */
@property (nonatomic, assign) NSInteger number1;
/**
 *  number2
 */
@property (nonatomic, assign) NSInteger number2;

- (void)getResult;

@end
