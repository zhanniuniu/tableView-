//
//  ProvinceModel.m
//  TableViewSelect
//
//  Created by dlt_zhanlijun on 16/9/26.
//  Copyright © 2016年 dlt_zhanlijun. All rights reserved.
//

#import "ProvinceModel.h"

@implementation ProvinceModel
-(instancetype)initWithText:(NSString *)text selected:(BOOL)selected
{
    if (self = [super init]) {
        self.text = text;
        self.selected = selected;
    }
    return self;
}

+(id)provinceModelWithText:(NSString *)text slected:(BOOL)selected
{
    return [[self alloc] initWithText:text selected:selected];
}

@end
