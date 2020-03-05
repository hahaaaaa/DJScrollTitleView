//
//  ViewController.m
//  DJScrollTitleViewDemo
//
//  Created by DJSword on 2020/3/5.
//  Copyright © 2020 DJSword. All rights reserved.
//  第一次提交

#import "ViewController.h"
#import "DJScrollTitleView.h"

@interface ViewController ()<DJScrollTitleViewDelegate>

@property (strong, nonatomic) DJScrollTitleView *titleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    self.view.backgroundColor = [UIColor purpleColor];
    _titleView = [[DJScrollTitleView alloc] initWithFrame:CGRectMake(0, 100, UIScreen.mainScreen.bounds.size.width, 50)];
    _titleView.dataSource = @[@"推荐",@"科技版",@"人",@"Hip-hop",@"娱乐先锋",@"国际时政要闻",@"考研"];
    _titleView.delegate = self;
    [self.view addSubview:_titleView];
    
}
- (void)DJScrollTitleView:(DJScrollTitleView *)titleView clickIndex:(NSInteger)index {
    NSLog(@"点击了第%ld",index);
}
@end
