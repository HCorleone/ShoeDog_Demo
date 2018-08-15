//
//  homeTableViewCell.m
//  wudi5.0
//
//  Created by 无敌帅枫 on 2018/6/8.
//  Copyright © 2018年 无敌帅枫. All rights reserved.
//

#import "homeTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface homeTableViewCell ()

@property (strong,nonatomic) UILabel *SneakerName;
@property (strong,nonatomic) UILabel *SneakerBuy;
@property (strong,nonatomic) UILabel *SneakerPrice;
@property (strong,nonatomic) UILabel *ReleaseData;
@property (strong,nonatomic) UIImageView *SneakerImage;

@end

@implementation homeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:@"cellId"];
    
    if (self) {
        
        //添加图片SneakerImageView
        self.SneakerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,152, 105)];
        self.SneakerImage.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.SneakerImage];
        //添加标签SneakerName
        self.SneakerName = [[UILabel alloc] init];
        self.SneakerName.font = [UIFont fontWithName:@"Oswald" size:15];
        //添加标签SneakerPrice
        self.SneakerPrice = [[UILabel alloc]init];
        self.SneakerPrice.font = [UIFont fontWithName:@"Oswald" size:17];
        self.SneakerPrice.textColor = [UIColor redColor];
        //添加标签SneakerBuy
        self.SneakerBuy = [[UILabel alloc]init];
        self.SneakerBuy.font = [UIFont fontWithName:@"Oswald-Light" size:13];
        //添加标签ReleaseData
        self.ReleaseData = [[UILabel alloc]init];
        self.ReleaseData.font = [UIFont fontWithName:@"Oswald-Light" size:15];
        
    }
    
    return self;

}


- (void)setModel:(sneakerDataModel *)model {
    _model = model;
    self.SneakerName.text = model.sneakerName;
    
    [self.SneakerImage sd_setImageWithURL:[NSURL URLWithString:model.pngPath] placeholderImage:nil options: SDWebImageRetryFailed | SDWebImageProgressiveDownload progress:nil completed:nil];
    
    self.SneakerPrice.text = model.sneakerPrice;
    self.SneakerBuy.text = @"BUY NOW FROM ";
    self.ReleaseData.text = model.releaseData;
    [self resetFrame];
}

-(void)resetFrame{
    //标签SneakerName定位
    self.SneakerName.numberOfLines = 0;
    self.SneakerName.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize size = [self.SneakerName sizeThatFits:CGSizeMake(200, MAXFLOAT)];
    self.SneakerName.frame = CGRectMake(169, 16, 200,size.height);
    [self addSubview:self.SneakerName];
    //标签SneakerBuy定位
    self.SneakerBuy.frame = CGRectMake(169, self.SneakerName.frame.origin.y + self.SneakerName.frame.size.height, 77, 20);
    [self addSubview:self.SneakerBuy];
    //标签SneakerPrice定位
    self.SneakerPrice.frame = CGRectMake(self.SneakerBuy.frame.origin.x + self.SneakerBuy.frame.size.width, self.SneakerName.frame.origin.y + self.SneakerName.frame.size.height, 41, 20);
    [self addSubview:self.SneakerPrice];
    //标签ReleaseData定位
    self.ReleaseData.frame = CGRectMake(169, self.SneakerBuy.frame.origin.y + self.SneakerBuy.frame.size.height, 80, 23);
    [self addSubview:self.ReleaseData];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
