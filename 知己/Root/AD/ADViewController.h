//
//  ADViewController.h
//  知己
//
//  Created by 周天荣 on 2019/5/26.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^ CustomSkipButtonClickBlock)(void);

@interface ADViewController : UIViewController

@property (nonatomic,copy) CustomSkipButtonClickBlock skipButtonClickBlock;

@end

NS_ASSUME_NONNULL_END
