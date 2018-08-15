//
//  sneakerDataModel.h
//  wudi5.0
//
//  Created by 无敌帅枫 on 2018/6/13.
//  Copyright © 2018年 无敌帅枫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sneakerDataModel : NSObject

@property(strong,nonatomic) NSString *sneakerName;
@property(strong,nonatomic) NSString *sneakerBrand;
@property(strong,nonatomic) NSString *releaseData;
@property(strong,nonatomic) NSString *sneakerPrice;
@property(strong,nonatomic) NSString *pngPath;
@property(strong,nonatomic) NSString *pngPath2;


+ (sneakerDataModel *)configsneakerDataModelWith:(NSDictionary *)aDic;

@end
