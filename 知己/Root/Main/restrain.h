//
//  restrain.h
//  知己
//
//  Created by Anthony Zhang on 2019/5/25.
//  Copyright © 2019 周天荣. All rights reserved.
//

#ifndef restrain_h
#define restrain_h

//获取屏幕宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//生成随机颜色
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RandomColor random(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255), 200)
//状态栏高度
#define statusHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#endif /* restrain_h */
