//
//  StrategyContext.m
//  DesignPatternDemo
//
//  Created by 魏信洋 on 2017/8/18.
//  Copyright © 2017年 com.allen. All rights reserved.
//

#import "StrategyContext.h"
#import "DiscountsPayment.h"
#import "PromotionPayment.h"
#import "GroupBuyPayment.h"

NSString *const KDiscounts = @"DiscountsPayment";
NSString *const KPromotion = @"PromotionPayment";
NSString *const KGroupBuy = @"GroupBuyPayment";

@implementation StrategyContext

+ (void)getPaymentResultWithPayType:(PayType)payType{
    switch (payType) {
        case PayTypeDiscounts:
        {
            DiscountsPayment *dis = [[DiscountsPayment alloc] init];
            [dis payment];
        }
            break;
        case PayTypePromotion:
        {
            PromotionPayment *pro = [[PromotionPayment alloc] init];
            [pro payment];
        }
            break;
        case PayTypeGroupBuy:
        {
            GroupBuyPayment *group = [[GroupBuyPayment alloc] init];
            [group payment];
        }
            break;
    }
}

+ (void)getPaymentResultWithPayWithName:(NSString *)payType{
    
    NSInvocation *invocation = [self strategyInvocations][payType];
    //NSLog(@"%@",[self strategyInvocations]);
    id paymentName = [[NSClassFromString(payType) alloc] init];
    //需要在这里指明target
    [invocation invokeWithTarget:paymentName];
    
//    [invocation invoke];如果用这种方式,那么会造成坏内存访问
    
    //通过perform selector方式,也是可以的
//    id paymentNameClass = NSClassFromString(payType);
//    id paymentName = [[paymentNameClass alloc] init];
//    [paymentName performSelector:@selector(payment)];
}

+ (NSDictionary<NSString *,NSInvocation *> *)strategyInvocations{
    
    NSDictionary *invocations = @{
                                  KDiscounts : [self invoke:KDiscounts],
                                  KPromotion : [self invoke:KPromotion],
                                  KGroupBuy : [self invoke:KGroupBuy]
                                  };
    return invocations;
}


+ (NSInvocation *)invoke:(NSString *)name{
    id paymentNameClass = NSClassFromString(name);
    NSMethodSignature *ms = [paymentNameClass instanceMethodSignatureForSelector:@selector(payment)];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:ms];
//    invocation.target = obj;,因为target 使用assgin修饰的,是个弱引用,过了这里就被释放了
    invocation.selector = @selector(payment);
    return invocation;
}

@end
