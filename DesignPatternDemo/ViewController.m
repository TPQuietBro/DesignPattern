//
//  ViewController.m
//  DesignPatternDemo
//
//  Created by 魏信洋 on 2017/8/18.
//  Copyright © 2017年 com.allen. All rights reserved.
//

#import "ViewController.h"
#import "CalculateOperation.h"
#import "CalculateFactory.h"

#import "StrategyContext.h"

#define result operation.number1 = 18;operation.number2 = 6;[operation getResult]

NSString *const KAdd = @"Add";
NSString *const KMinus = @"Minus";
NSString *const KMulti = @"Multi";
NSString *const KDivision = @"Division";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //简单工厂模式
//    [self simpleFactory];
    //策略模式
    [self strategy];
}

- (void)strategy{
    //利用枚举调用
//    [StrategyContext getPaymentResultWithPayType:PayTypeDiscounts];
//    [StrategyContext getPaymentResultWithPayType:PayTypePromotion];
//    [StrategyContext getPaymentResultWithPayType:PayTypeGroupBuy];
//    
    //利用字符串调用
    [StrategyContext getPaymentResultWithPayWithName:@"DiscountsPayment"];
    [StrategyContext getPaymentResultWithPayWithName:@"PromotionPayment"];
    [StrategyContext getPaymentResultWithPayWithName:@"GroupBuyPayment"];
}

- (void)simpleFactory{
    [self add];
    [self minus];
    [self multi];
    [self division];
}

- (void)add{
//    CalculateOperation *operation = [CalculateFactory calculateOperaionWithSign:CalculateSignAdd];
    //利用反射优化
    
    CalculateOperation *operation = [CalculateFactory calculateOperaionWithOperationName:KAdd];
    
    result;
}
- (void)minus{
//    CalculateOperation *operation = [CalculateFactory calculateOperaionWithSign:CalculateSignMinus];
    CalculateOperation *operation = [CalculateFactory calculateOperaionWithOperationName:KMinus];
    
    result;
}
- (void)multi{
//    CalculateOperation *operation = [CalculateFactory calculateOperaionWithSign:CalculateSignMulti];
    CalculateOperation *operation = [CalculateFactory calculateOperaionWithOperationName:KMulti];
    result;
}
- (void)division{
    
//    CalculateOperation *operation = [CalculateFactory calculateOperaionWithSign:CalculateSignDivision];
    CalculateOperation *operation = [CalculateFactory calculateOperaionWithOperationName:KDivision];
    result;
}

@end
