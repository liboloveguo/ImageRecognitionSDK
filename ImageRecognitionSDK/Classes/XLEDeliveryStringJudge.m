//
//  XLEDeliveryStringJudge.m
//  Receiver
//
//  Created by 张利果 on 2018/8/15.
//  Copyright © 2018年 LongZhen. All rights reserved.
//

#import "XLEDeliveryStringJudge.h"

@implementation XLEDeliveryStringJudge

/**
 * 判断字符串是否存在
 * yes为空或不存在 no为字符串存在
 */
+ (BOOL)stringIsBlank:(NSString *)string{
    if (string == nil || string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }

    return NO;
}
/**
 * 只允许输入汉字数字英文空格和-
 * 判断是否含有非法字符 yes有非法字符  no没有非法字符
 */
+ (BOOL)allowNameInput:(NSString *)content{
    //先把字符串中的空格和—号过滤掉
    NSString *strs = [content stringByReplacingOccurrencesOfString:@" " withString:@""];
    strs = [strs stringByReplacingOccurrencesOfString:@"-" withString:@""];
    strs = [strs stringByReplacingOccurrencesOfString:@"—" withString:@""];
    strs = [strs stringByReplacingOccurrencesOfString:@"─" withString:@""];
    
    if (strs.length == 0) return NO;
    
    //提示 标签不能输入特殊字符
    NSString *str =@"^[A-Za-z0-9\\u4e00-\u9fa5]+$";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    if (![emailTest evaluateWithObject:strs]) {
        return YES;
    }
    return NO;
}

/**
 * 判断电话号码
 * yes为符合筛选条件 no为不符合筛选条件
 */
+ (BOOL)isPureNumberandCharacters:(NSString *)string{
    //首字符
    NSString *str2 = [string substringToIndex:1];
    //1开头是电话号码
    if ([str2 isEqualToString:@"1"]) {
        if (string.length == 11) {
            //纯数字
            NSString *str1=[string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
            if (str1.length > 0) {
                return NO;
            }
            else{
                return YES;//是纯数字
            }
        }
        else{
            return NO;
        }
    }
    //其他座机
    else{
        if (string.length >= 4 && string.length <= 12) {
            //纯数字
            NSString *str1=[string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
            if (str1.length > 0) {
                return NO;
            }
            else{
                return YES;//是纯数字
            }
        }
        else{
            return NO;
        }
    }
}

/**
 * 去表情去空格
 * yes为包含特殊符号 no为不包括特殊符号
 */
+ (BOOL)disable_emoji:(NSString *)text{
    int a=(int)text.length;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:text
                                                               options:0
                                                                 range:NSMakeRange(0, [text length])
                                                          withTemplate:@""];
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"*/\\:|\"?<>"];
    
    modifiedString =  [modifiedString stringByTrimmingCharactersInSet:set];
    
    if (a>(int)modifiedString.length) {
        return YES;//包含特殊符号
    }
    return NO;
}

/**
 * 详细地址输入字符
 * yes为包含特殊符号 no为不包括特殊符号
 */
+ (BOOL)detailAddressInput:(NSString *)content{
    NSString *strs = [self replaceSpecialChar:content];
    //
    if (strs.length == 0) return NO;
    
    //提示 标签不能输入特殊字符
    NSString *str =@"^[A-Za-z0-9\\u4e00-\u9fa5]+$";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    if (![emailTest evaluateWithObject:strs]) {
        return YES;
    }
    return NO;
}

+ (NSString *)replaceSpecialChar:(NSString *)string {
    //先把字符串中的空格和—号过滤掉
    NSString *strs = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    strs = [strs stringByReplacingOccurrencesOfString:@"-" withString:@""];
    strs = [strs stringByReplacingOccurrencesOfString:@"—" withString:@""];
    strs = [strs stringByReplacingOccurrencesOfString:@"─" withString:@""];
    strs = [strs stringByReplacingOccurrencesOfString:@"|" withString:@""];
    strs = [strs stringByReplacingOccurrencesOfString:@"｜" withString:@""];
    //中文
    strs = [strs stringByReplacingOccurrencesOfString:@"＃" withString:@""];
    strs = [strs stringByReplacingOccurrencesOfString:@"，" withString:@""];
    strs = [strs stringByReplacingOccurrencesOfString:@"（" withString:@""];
    strs = [strs stringByReplacingOccurrencesOfString:@"）" withString:@""];
    //英文
    strs = [strs stringByReplacingOccurrencesOfString:@"#" withString:@""];
    strs = [strs stringByReplacingOccurrencesOfString:@"," withString:@""];
    strs = [strs stringByReplacingOccurrencesOfString:@"(" withString:@""];
    strs = [strs stringByReplacingOccurrencesOfString:@")" withString:@""];
    return strs;
}
/**
 * 运单号条件判断
 * yes表示符合条件 no表示(包含“-”号以及数字和大小写中英文以外的其他符号)
 */
+ (BOOL)checkIsHaveNumAndLetter:(NSString *)orderNumber{
    NSString *string = [orderNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    if (string.length == 0) return YES;
    
    //数字条件
    NSRegularExpression *tNumRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[0-9]"options:NSRegularExpressionCaseInsensitive error:nil];
    //符合数字条件的有几个字节
    NSUInteger tNumMatchCount = [tNumRegularExpression numberOfMatchesInString:string
                                 
                                                                       options:NSMatchingReportProgress
                                 
                                                                         range:NSMakeRange(0, string.length)];
    
    //英文字条件
    NSRegularExpression *tLetterRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]"options:NSRegularExpressionCaseInsensitive error:nil];
    //符合英文字条件的有几个字节
    NSUInteger tLetterMatchCount = [tLetterRegularExpression numberOfMatchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, string.length)];
    
    
    //符合英文和符合数字条件的相加等于字符串长度
    if (tNumMatchCount + tLetterMatchCount == string.length) return YES;

    return NO;
}

/**
 * 过滤复制的电话号码为纯数字
 */
+ (NSString *)filterPhoneNumbersToPureNumbers:(NSString *)string{
    if ([self stringIsBlank:string]) {
        return @"";
    }
    NSString *strs = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    strs = [strs stringByReplacingOccurrencesOfString:@"+86" withString:@""];
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"（）()-—─"];
    strs = [[strs componentsSeparatedByCharactersInSet: doNotWant]componentsJoinedByString: @""];
    NSLog(@"%@",strs);
    return strs;
}
@end
