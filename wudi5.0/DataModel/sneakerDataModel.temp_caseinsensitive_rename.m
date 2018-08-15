//
//  sneakerDataModel.m
//  wudi5.0
//
//  Created by 无敌帅枫 on 2018/6/13.
//  Copyright © 2018年 无敌帅枫. All rights reserved.
//

#import "sneakerDataModel.h"

@interface sneakerDataModel()

@end

@implementation sneakerDataModel

+ (sneakerDataModel *)configsneakerDataModelWith:(NSDictionary *)aDic {
    
    sneakerDataModel *model = [sneakerDataModel new];
    
    model.sneakerName = aDic[@"SneakerName"];
    model.sneakerBrand = aDic[@"SneakerBrand"];
    model.sneakerPrice = aDic[@"SneakerPrice"];
    model.releaseData = aDic[@"ReleaseData"];
    
    return model;
    
}

@end
