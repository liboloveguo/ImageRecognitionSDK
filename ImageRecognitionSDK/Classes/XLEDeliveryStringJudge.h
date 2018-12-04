//
//  XLEDeliveryStringJudge.h
//  Receiver
//
//  Created by 张利果 on 2018/8/15.
//  Copyright © 2018年 LongZhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLEDeliveryStringJudge : NSObject
+ (BOOL)stringIsBlank:(NSString *)string;
+ (BOOL)allowNameInput:(NSString *)content;
+ (BOOL)isPureNumberandCharacters:(NSString *)string;
+ (BOOL)disable_emoji:(NSString *)text;
+ (BOOL)detailAddressInput:(NSString *)content;
+ (BOOL)checkIsHaveNumAndLetter:(NSString *)orderNumber;
+ (NSString *)replaceSpecialChar:(NSString *)string;
+ (NSString *)filterPhoneNumbersToPureNumbers:(NSString *)string;
@end
