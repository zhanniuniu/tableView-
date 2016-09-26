//
//  pinyin.h
//  dangdang_1.2
//
//  Created by zhan123456 on 15/8/24.
//  Copyright (c) 2015年 山东农大小苹果. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HANZI_START 19968

#define HANZI_COUNT 20902


@interface pinyin : NSObject

+ (NSString *)pinyinFirstLetter:(unsigned short)hanzi;



@end
