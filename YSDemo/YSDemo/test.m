//
//  test.m
//  YSDemo
//
//  Created by 姚帅 on 2021/1/28.
//


#import <Foundation/Foundation.h>

/// 拼接字符创，然后打印
/// @param str1 字符串1
/// @param str2 字符串2
void outputAppendString (char *str1, char *str2) {
    NSString *string1 = [[NSString alloc] initWithUTF8String:str1];
    NSString *string2 = [[NSString alloc] initWithUTF8String:str2];
    NSLog(@"%@", [NSString stringWithFormat:@"%@-%@", string1, string2]);
}
