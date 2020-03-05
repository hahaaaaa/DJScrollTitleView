//
//  DJScrollTitleView.h
//  DJScrollTitleViewDemo
//
//  Created by DJSword on 2020/3/5.
//  Copyright © 2020 DJSword. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DJScrollTitleView;

@protocol DJScrollTitleViewDelegate <NSObject>

- (void)DJScrollTitleView:(DJScrollTitleView *)titleView clickIndex:(NSInteger)index;

@end

@interface DJScrollTitleView : UIView

@property (strong, nonatomic) NSArray *dataSource;

@property (assign, nonatomic) NSInteger currentIndex;

@property (weak, nonatomic) id<DJScrollTitleViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
