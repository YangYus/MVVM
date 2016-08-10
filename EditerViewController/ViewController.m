//
//  MessageViewController.m
//  ZhuanTiKu_GWY
//
//  Created by yangyu on 16/7/11.
//  Copyright © 2016年 youbinbin. All rights reserved.
//

#import "ViewController.h"
#import "MessageListDataController.h"
#import "MessageFootView.h"
#import "UIColor+zhangshujia.h"
#import "MessageViewModel.h"
#import "messageCell.h"
#import "Masonry.h"
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
static NSString *ID = @"messageID";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,MessageFootViewDelegate>
@property (nonatomic, strong) UITableView *messageTableView;
@property (nonatomic, strong) MessageFootView *messageFootView;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) MessageListDataController *dataController;
@property (nonatomic, strong) MessageViewModel *viewModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
    [self initWithView];
    [self inintWithBarButtonItem];
    [self initWithMessageFootView];
    
}

#pragma mark - 懒加载
- (MessageFootView *)messageFootView {
    if (!_messageFootView) {
        _messageFootView = [[MessageFootView alloc] initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, 44)];
        _messageFootView.backgroundColor = [UIColor colorWithHexString:@"f6f6f7"];
        _messageFootView.delegate = self;
    }
    return _messageFootView;
}

- (MessageListDataController *)dataController {
    if (!_dataController) {
        _dataController = [MessageListDataController new];
    }
    return _dataController;
}

- (void)inintWithBarButtonItem {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button setTitle:@"编辑" forState:UIControlStateNormal];
    [button setTitle:@"取消" forState:UIControlStateSelected];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightBarButton:)
     forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = menuButton;
}

- (void)initWithMessageFootView {
    [self.view addSubview:self.messageFootView];
}

- (void)initWithView {
    self.messageTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.messageTableView registerNib:[UINib nibWithNibName:@"messageCell" bundle:nil] forCellReuseIdentifier:ID];
    self.messageTableView.delegate = self;
    self.messageTableView.dataSource = self;
    self.messageTableView.rowHeight = 80;
    self.messageTableView.tableFooterView = [UIView new];
    [self.view addSubview:self.messageTableView];
    [self.messageTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(-35);
    }];
}

- (void)loadData {
    self.dataController.select = NO;
    [self.dataController requestMessageListWithCallBack:^() {
        self.viewModel = [MessageViewModel viewModelWithMessageLists:self.dataController.listMessageArray];
        [self.messageTableView reloadData];
    }];
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.layout.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //只有编辑状态的时候选中才有效果
    if (self.dataController.select) {
        MessageLisetLayout *layout = self.viewModel.layout[indexPath.row];
        if (!layout.isSelected) {
            [self.dataController.deleteArray addObject:self.viewModel.layout[indexPath.row]];
        } else {
            [self.dataController.deleteArray removeObject:self.viewModel.layout[indexPath.row]];
        }
        //按钮选中 非选中
        layout.isSelected = !layout.isSelected;
        [self.messageTableView reloadData];
    }
    [self.messageTableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    messageCell *cell = [self.messageTableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.layout = self.viewModel.layout[indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateCellBtnHide];
}

#pragma mark - leftBtn
- (void)rightBarButton:(UIButton *)sender {
    if ((sender.selected = !sender.selected)) {
        self.dataController.select = YES;
        [self updateCellBtnHide];
        [self messageMasUpdate:0 tableViewBottom:-49];
        [self messageFootViewHideen:49];
    } else {
        [self messageMasUpdate:-35 tableViewBottom:0];
        [self messageFootViewHideen:0];
        
    }
}

- (void)messageFootViewHideen:(int)footViewY {
    [UIView animateWithDuration:0.25 animations:^{
        self.messageFootView.frame = CGRectMake(0, kScreenHeight - footViewY, kScreenWidth, 44);
    }];
}

- (void)messageMasUpdate:(int)leftX tableViewBottom:(int)bottomY {
    [UIView animateWithDuration:0.25 animations:^{
        [self.messageTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left).offset(leftX);
            make.bottom.equalTo(self.view.mas_bottom).offset(bottomY);
        }];
        [self.messageTableView layoutIfNeeded];
    }];
}

//显示Cell上的Button
- (void)updateCellBtnHide {
    NSArray *array = self.messageTableView.visibleCells;
    for (messageCell *cell in array) {
        cell.messageBtn.hidden = NO;
    }
}

#pragma mark messageFootViewDelegate
//全选
- (void)messageFootViewSelectBtn:(UIButton *)Btn {
    if ((Btn.selected = !Btn.selected)) {
        for (MessageLisetLayout *layout in self.viewModel.layout) {
            layout.isSelected = YES;
        }
        [self.dataController.deleteArray addObjectsFromArray:self.viewModel.layout];
        [self.messageTableView reloadData];
    } else {
        for (MessageLisetLayout *layout in self.viewModel.layout) {
            layout.isSelected = NO;
        }
        [self.dataController.deleteArray removeObjectsInArray:self.viewModel.layout];
        [self.messageTableView reloadData];
    }
}

//删除
- (void)messageFootViewDeleteBtn:(UIButton *)Btn {
    [self.viewModel.layout removeObjectsInArray:self.dataController.deleteArray];
    [self.messageTableView reloadData];
}
@end
