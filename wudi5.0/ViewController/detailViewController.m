//
//  detailViewController.m
//  wudi5.0
//
//  Created by 无敌帅枫 on 2018/6/11.
//  Copyright © 2018年 无敌帅枫. All rights reserved.
//

#import "detailViewController.h"
#import "homeTableViewController.h"
#import "UIImageView+WebCache.h"
#import "buyTiaoZhuan.h"

@interface detailViewController ()

@property(strong,nonatomic)UIImageView *SneakerImage;
@property(strong,nonatomic)UILabel *SneakerName;
@property(strong,nonatomic)UIImageView *WantImage;
@property(strong,nonatomic)UILabel *SneakerPrice;
@property(strong,nonatomic)UILabel *BrandInfo;
@property(strong,nonatomic)UIButton *BuyBtn;
@property(strong,nonatomic)UIButton *FavBtn;
@property(strong,nonatomic)UIButton *ShareBtn;
@property(strong,nonatomic)buyTiaoZhuan *buyTiaoZhuan;
@property(strong,nonatomic)UIImageView *aiXinAnimate;
@property(strong,nonatomic)UIButton *closeBtn1;

@end

@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载界面
    [self loadDetailView];
    //加载模型
    [self setBmodel:_bmodel];
    
    
    UITapGestureRecognizer *tapImageView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(moreImages:)];
    [self.SneakerImage addGestureRecognizer:tapImageView];
    self.SneakerImage.userInteractionEnabled = YES;
    
    UIPanGestureRecognizer *backPop = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(backPop:)];
    [self.view addGestureRecognizer:backPop];
    self.view.userInteractionEnabled = YES;
    
}

-(void)closeBtn1Click:(UIButton *)btn{
    self.closeBtn1.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        CGRect temp = self.SneakerImage.frame;
        temp.size.height = 258;
        self.SneakerImage.frame = temp;
        self.SneakerImage.center = CGPointMake(187.5, 178);
        
        CGRect temp1 = self.ShareBtn.frame;
        temp1.size.width = 124;
        self.ShareBtn.frame = temp1;
        self.ShareBtn.center = CGPointMake(313, 642.5);
    } completion:^(BOOL finished){
        [self.view sendSubviewToBack:self.ShareBtn];
    }];
}

-(void)moreImages:(id)sender{
    [self.view bringSubviewToFront:self.SneakerImage];
    [self.view bringSubviewToFront:self.closeBtn1];
    [self.view bringSubviewToFront:self.ShareBtn];
    [UIView animateWithDuration:0.5 animations:^{
        CGRect temp = self.SneakerImage.frame;
        temp.size.height = 554;
        self.SneakerImage.frame = temp;
        self.SneakerImage.center = CGPointMake(187.5, 271);
        
        CGRect temp1 = self.ShareBtn.frame;
        temp1.size.width = 375;
        self.ShareBtn.frame = temp1;
        self.ShareBtn.center = CGPointMake(187.5, 642.5);
        
    } completion:^(BOOL finished){
        self.closeBtn1.hidden = NO;
    }];
}

-(void)loadDetailView {
    //设置返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(backPop:)];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    //设置背景色（解决页面跳转时卡顿）
    self.view.backgroundColor=[UIColor whiteColor];
    
    //设置Sneaker图片展示View
    self.SneakerImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 49, screen.size.width, 258)];
    self.SneakerImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.SneakerImage];
    
    //设置Sneaker名字标签label
    self.SneakerName = [[UILabel alloc]initWithFrame:CGRectMake(20, self.SneakerImage.frame.origin.y + self.SneakerImage.frame.size.height + 10, 335, 21)];
    self.SneakerName.font = [UIFont fontWithName:@"Oswald" size:18];
    [self.view addSubview:self.SneakerName];
    
    //设置WantImage
    self.WantImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, self.SneakerName.frame.origin.y + self.SneakerName.frame.size.height + 5, 20, 18)];
    self.WantImage.image = [UIImage imageNamed:@"btn_want_black_new"];
    [self.view addSubview:self.WantImage];
    
    //设置WantNum(暂时保留为3,066)
    UILabel *WantNum = [[UILabel alloc]initWithFrame:CGRectMake(self.WantImage.frame.origin.x + self.WantImage.frame.size.width +8, self.SneakerName.frame.origin.y + self.SneakerName.frame.size.height + 5, 100,18 )];
    WantNum.text = @"3,066 WANTS";
    WantNum.font = [UIFont fontWithName:@"Oswald" size:15];
    [self.view addSubview:WantNum];
    
    //设置BuyBtn按钮
    self.BuyBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, screen.size.height - 49, screen.size.width/3 - 1, 49)];
    [self.BuyBtn setImage:[UIImage imageNamed:@"buyBtn"] forState:UIControlStateNormal];
    self.BuyBtn.imageView.contentMode = UIViewContentModeScaleToFill;
    [self.BuyBtn addTarget:self action:@selector(BuyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.BuyBtn];
    
    //设置FavBtn按钮
    self.FavBtn = [[UIButton alloc]initWithFrame:CGRectMake(screen.size.width/3 + 1, screen.size.height - 49, screen.size.width/3 - 2, 49)];
    [self.FavBtn setImage:[UIImage imageNamed:@"wantBtn"] forState:UIControlStateNormal];
    self.FavBtn.imageView.contentMode = UIViewContentModeScaleToFill;
    [self.FavBtn addTarget:self action:@selector(aiXinImages:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.FavBtn];
    //设置ShareBtn按钮
    self.ShareBtn = [[UIButton alloc]initWithFrame:CGRectMake(screen.size.width/3*2 + 1, screen.size.height - 49, screen.size.width/3 - 1, 49)];
    [self.ShareBtn setImage:[UIImage imageNamed:@"shareBtn1"] forState:UIControlStateNormal];
    self.ShareBtn.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.ShareBtn];
    
    //爱心动画准备
    self.aiXinAnimate = [[UIImageView alloc]initWithFrame:CGRectMake(165, 636, 15, 13)];
    self.aiXinAnimate.image = [UIImage imageNamed:@"btn_want_selected_new"];
    [self.view addSubview:self.aiXinAnimate];
    
    
    
    //设置关闭多图浏览按钮
    self.closeBtn1 = [[UIButton alloc]initWithFrame:CGRectMake(339, 64, 30, 30)];
    [self.closeBtn1 setImage:[UIImage imageNamed:@"closeBtn1"] forState:UIControlStateNormal];
    [self.closeBtn1 addTarget:self action:@selector(closeBtn1Click:) forControlEvents:UIControlEventTouchUpInside];
    self.closeBtn1.hidden = YES;
    [self.view addSubview:self.closeBtn1];
    
    //设置购买跳转view
    self.buyTiaoZhuan = [[buyTiaoZhuan alloc]initWithFrame:CGRectMake(0, screen.size.height, screen.size.width, 180)];
    [self.view addSubview:self.buyTiaoZhuan];
    [self.buyTiaoZhuan.closeBtn addTarget:self action:@selector(closeBtnClick:) forControlEvents:UIControlEventTouchUpInside];

}

-(void)aiXinImages:(UIButton *)btn{
    
    
    [UIView animateWithDuration:0.5 animations:^{
        self.aiXinAnimate.center = CGPointMake(172.5, 586);
    } completion:^(BOOL Finised){
        self.aiXinAnimate.center = CGPointMake(172.5, 642.5);
    }];
    
}

-(void)setBmodel:(sneakerDataModel *)bmodel{
    _bmodel = bmodel;
    self.SneakerName.text = bmodel.sneakerName;
    [self.SneakerImage sd_setImageWithURL:[NSURL URLWithString:bmodel.pngPath2] placeholderImage:nil options: SDWebImageRetryFailed | SDWebImageProgressiveDownload progress:nil completed:nil];
    
}

- (void)backPop:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)BuyBtnClick:(UIButton *)btn{
    [UIView animateWithDuration:0.5 animations:^{
        self.buyTiaoZhuan.center = CGPointMake(187.5, 577);
    }];

}

-(void)closeBtnClick:(UIButton *)btn{
    [UIView animateWithDuration:0.5 animations:^{
        self.buyTiaoZhuan.center = CGPointMake(187.5, 767);
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
