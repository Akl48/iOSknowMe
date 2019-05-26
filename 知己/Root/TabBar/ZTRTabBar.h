//
//  ZTRTabBar.h
//  知己
//
//  Created by 周天荣 on 2019/5/26.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZTRTabBarDelegate <NSObject>

- (void)callForAI;

@end
@interface ZTRTabBar : UITabBar

@property(weak,nonatomic) id <ZTRTabBarDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
