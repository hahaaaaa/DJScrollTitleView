//
//  DJScrollTitleView.m
//  DJScrollTitleViewDemo
//
//  Created by DJSword on 2020/3/5.
//  Copyright © 2020 DJSword. All rights reserved.
//

#import "DJScrollTitleView.h"
#import "Masonry.h"

#define KScreenWidth UIScreen.mainScreen.bounds.size.width

@interface DJScrollTitleView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UIView *lineView;

@end

@implementation DJScrollTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initCollectionView];
    }
    return self;
}
- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    NSString *firstString = self.dataSource.firstObject;
    CGSize size = [firstString boundingRectWithSize:CGSizeMake(0, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    self.lineView.frame = CGRectMake(5 + 5, 47, size.width + 10, 3);
    [self.collectionView reloadData];
}
- (void)layoutSubviews {
    [super layoutSubviews];
}
- (void)initCollectionView {
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.estimatedItemSize = CGSizeMake(50, 40);
    layout.minimumLineSpacing = 15;
    layout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 30);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.backgroundColor = UIColor.clearColor;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    [self addSubview:self.collectionView];

}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    
    UILabel *label = [cell.contentView viewWithTag:100];
    if (!label) {
        label = [UILabel new];
        label.tag = 100;
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView).insets(UIEdgeInsetsMake(10, 5, 10, 5));
        }];
    }
    
    NSString *string = self.dataSource[indexPath.row];
    label.text = string;
    if (self.currentIndex == indexPath.row) {
        label.textColor = [UIColor colorWithWhite:1 alpha:1];
        
    } else {
        label.textColor = [UIColor colorWithWhite:1 alpha:.6];
    }
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    UICollectionViewCell *lastCell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:self.currentIndex inSection:0]];
    
    CGPoint center = cell.center;
    
    CGFloat contentwidth = collectionView.contentSize.width;
    
    CGFloat centX = KScreenWidth/2.f;
    
    if (center.x < centX) {
        
        [collectionView setContentOffset:CGPointMake(0, 0) animated:YES];
        
    }else if (center.x >= centX && center.x <= (contentwidth - centX)) {
        
        [collectionView setContentOffset:CGPointMake(center.x - centX, 0) animated:YES];
        
    } else if (center.x > (contentwidth - centX)) {
        
        [collectionView setContentOffset:CGPointMake(contentwidth - KScreenWidth, 0) animated:YES];
        
    }
    
    UILabel *label = [cell.contentView viewWithTag:100];
    UILabel *lastLabel = [lastCell.contentView viewWithTag:100];
    
    if (self.currentIndex != indexPath.row) {
        
        lastLabel.textColor = [UIColor colorWithWhite:1 alpha:.6];
        label.textColor = UIColor.whiteColor;
        
        self.currentIndex = indexPath.row;
        [UIView animateWithDuration:.3 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
            self.lineView.frame = CGRectMake(cell.frame.origin.x + 5, 47, cell.bounds.size.width - 10, 3);
        } completion:^(BOOL finished) {
            
        }];
        
        if ([self.delegate respondsToSelector:@selector(DJScrollTitleView:clickIndex:)]) {
            [self.delegate DJScrollTitleView:self clickIndex:indexPath.row];
        }
    }
    
}
#pragma mark ----------------------------------------------------- lineview
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor colorWithRed:236/255.f green:85/255.f blue:137/255.f alpha:1];
        [self.collectionView addSubview:_lineView];

    }
    return _lineView;
}

@end
