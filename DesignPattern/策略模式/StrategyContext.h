//
//  StrategyContext.h
//  DesignPatternDemo
//
//  Created by 魏信洋 on 2017/8/18.
//  Copyright © 2017年 com.allen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,PayType){
    PayTypeDiscounts,
    PayTypePromotion,
    PayTypeGroupBuy,
};

@interface StrategyContext : NSObject

+ (void)getPaymentResultWithPayType:(PayType)payType;

+ (void)getPaymentResultWithPayWithName:(NSString *)payType;

@end
