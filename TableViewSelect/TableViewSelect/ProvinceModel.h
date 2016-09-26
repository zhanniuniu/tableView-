//
//  ProvinceModel.h
//  TableViewSelect
//
//  Created by dlt_zhanlijun on 16/9/26.
//  Copyright © 2016年 dlt_zhanlijun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProvinceModel : NSObject

@property (nonatomic,strong)NSString *text;
@property (nonatomic,assign)BOOL selected;

+(id)provinceModelWithText:(NSString *)text slected:(BOOL)selected;

@end
