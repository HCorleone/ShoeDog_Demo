//
//  homeTableViewController.m
//  wudi5.0
//
//  Created by 无敌帅枫 on 2018/6/8.
//  Copyright © 2018年 无敌帅枫. All rights reserved.
//
#import "homeTableViewController.h"
#import "homeTableViewCell.h"
#import "detailViewController.h"
#import "newView.h"
#import "sneakerDataModel.h"
#import "SWRevealViewController.h"
#import "AFNetworking.h"
#import "headerView.h"
#import "UIImageView+WebCache.h"


@interface homeTableViewController ()<UITextFieldDelegate>

@property(strong,nonatomic) NSMutableArray *listData;
@property(strong,nonatomic) UITextField *search;

@end

@implementation homeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册headerCell
//    [self.tableView registerClass:(nullable Class) forHeaderFooterViewReuseIdentifier:(nonnull NSString *)];
    //注册Cell
    [self.tableView registerClass:[homeTableViewCell class] forCellReuseIdentifier:@"cellId"];
    //设置Cell属性
    self.tableView.rowHeight = 110;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self setupRefresh];
    [self downLoadData];
    [self setNavView];

}

//设置刷新控件
-(void)setupRefresh{
    UIRefreshControl *refreshC = [[UIRefreshControl alloc]init];
    self.refreshControl = refreshC;
    [refreshC addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshC];
}

-(void)refresh:(UIRefreshControl *)sender{
    [self downLoadData];
}





//设置navigationBar样式
-(void)setNavView{
    //设置侧边栏
    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    revealController.rearViewRevealWidth = 300;
    
    //给导航栏添加左右按钮
    self.navigationController.navigationBar.tintColor = UIColor.blackColor;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu-icon"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"imgSetting_inactive"] style:UIBarButtonItemStylePlain target:self action:nil];
    //添加搜索框及搜索按钮
    UIView *newTitleView = [[newView alloc] initWithFrame:CGRectMake(130, 0, 200, 18)];
    self.search = [[UITextField alloc]initWithFrame:CGRectMake(30, 0, 170, 18)];
    self.search.placeholder = @" Search On ShoeDog";
    
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    [searchBtn setImage:[UIImage imageNamed:@"ic_search"] forState:UIControlStateNormal];
    
    [newTitleView addSubview:searchBtn];
    [newTitleView addSubview:self.search];
    self.navigationItem.titleView = newTitleView;

}


-(void)test:(UIButton *)sender{
    //清除图片缓存
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
    [[SDImageCache sharedImageCache] clearMemory];
}


//从服务器加载数据
-(void)downLoadData{
    
    NSString *URL = @"http://120.78.51.198/dataSource/AJ.json";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSURLSessionDataTask *dataTask = [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"code"] integerValue] == 1) {
            NSArray *jsonDataArr = responseObject[@"data"];
            self.listData = [NSMutableArray array];
            //建立模型数组
            for (int i =0; i < jsonDataArr.count; i++) {
                NSDictionary *aDic = jsonDataArr[i];
                sneakerDataModel *aModel = [sneakerDataModel configsneakerDataModelWith:aDic];
                [self.listData addObject:aModel];
            }
            //重新加载数据
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
        }
    } failure:nil];
    [dataTask resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    homeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.model = _listData[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    detailViewController *detailView = [[detailViewController alloc] init];
    detailView.bmodel = _listData[indexPath.row];
    [self.search resignFirstResponder];
    [self.navigationController pushViewController:detailView animated:YES];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
