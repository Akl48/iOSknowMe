//
//  MainViewController.m
//  KnowMe
//
//  Created by 周天荣 on 2018/11/17.
//  Copyright © 2018 周天荣. All rights reserved.
//

#import "MainViewController.h"
#import "MainCell.h"
#import "CompletePage.h"
#import "UserDetails.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerAnimatedTransitioning>


@end

@implementation MainViewController {
    NSIndexPath *currentIndexPath;
    
}

- (UIView *)headView {
    if (_headView == nil) {
        _headView = [[UIView alloc]init];
        _headView.backgroundColor = [UIColor clearColor];
    }
    return _headView;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.textColor = [UIColor grayColor];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _timeLabel;
}

- (UILabel *)bigLabel {
    if (_bigLabel == nil) {
        _bigLabel = [[UILabel alloc]init];
        _bigLabel.font = [UIFont systemFontOfSize:25];
        _bigLabel.textColor = [UIColor blackColor];
        _bigLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _bigLabel;
}

- (UIButton *)jump_to_user {
    if (_jump_to_user == nil) {
        _jump_to_user = [[UIButton alloc]init];
        _jump_to_user.backgroundColor = [UIColor clearColor];
    }
    return _jump_to_user;
}

- (instancetype)init{
    if(self = [super init])
    {
        self.tabBarItem.title = @"主页";

        // 设置图片,只有设置图片的渲染模式，才能看到图片
        self.tabBarItem.image = [[UIImage imageNamed:@"Main"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    }
    return self;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self initdata];
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = [self initheadView];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = YES;
    
    //MARK:暂时用来解决scale变小问题
    [self.tableView reloadData];
}

- (UIView *)initheadView {
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 115);
    
    //日期
    self.timeLabel.frame = CGRectMake(20, 30, SCREEN_WIDTH/2, 30);
    NSDate *date = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"YYYY-MM-dd"];
    self.timeLabel.text = [format stringFromDate:date];
    //大标题
    self.bigLabel.frame = CGRectMake(20, 55, (SCREEN_WIDTH/3)*2, 30);
    self.bigLabel.text = @"今天你喜欢什么？";
    //用户
    self.jump_to_user.frame = CGRectMake(SCREEN_WIDTH-80, 27.5, 60, 60);
    self.jump_to_user.layer.masksToBounds = YES;
    self.jump_to_user.layer.cornerRadius = 30;
    [self.jump_to_user setImage:[UIImage imageNamed:@"userpic"] forState:UIControlStateNormal];
    [self.jump_to_user addTarget:self action:@selector(jump_to_user_details) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.headView addSubview:self.timeLabel];
    [self.headView addSubview:self.bigLabel];
    [self.headView addSubview:self.jump_to_user];
    
    return self.headView;
}

- (void)jump_to_user_details {
    UserDetails *user = [[UserDetails alloc]init];
    [self.navigationController pushViewController:user animated:YES];
}

- (void)initdata {
    self.titleString = [[NSArray alloc]initWithObjects:@"画里的字谜", @"海燕与船长",@"伯乐训马",nil];
    self.contentString = [[NSArray alloc]initWithObjects:@"从前有个名动京城的年轻画家",@"一只海燕在飞行中学到了不少知识", @"马本来具有天生的素质",nil];
    self.completeContent = [[NSArray alloc]initWithObjects:
                            @"从前有个名动京城的年轻画家，他画技高超，许多达官贵人为了求到他的一幅好画常常一掷千金。不过，这位画家却不是一个贪图富贵的人，他喜爱自由自在的生活，于是有一天，他带着行囊云游四方去了。这天，画家来到了风景如画的江南名城——扬州，他心想，人们都说扬州城里人才济济，我倒要亲眼见识见识。于是他来到闹市大笔一挥，在纸上画了一只黑毛狮子狗。围观的人们见画上的狮子狗栩栩如生，不禁啧啧称奇，更有人激动地掏钱想买画了。可年轻画家微微一笑，说：“这画我是不卖的。不过这画中藏有一字，若是谁猜出了这个字，我就把画送给他。”众人一听有这等好事，便纷纷猜起谜来。这时，人群中走出一个清秀的少年，他不声不响地将那画卷起来，夹在腋下，转身就走。众人一时惊呆了，画家也忙上前问：“小娃娃，你还没猜呢，怎么就拿走我的画了呢？”少年还是不说话，自顾自地往外走，任凭众人在他耳边嚷嚷着“你倒是先猜谜呀”。看到这里，画家突然笑了起来：“哈哈，有趣的娃娃，果然是猜出了我的谜语啊。”",
                            @"一只海燕在飞行中学到了不少知识，能预见雷雨天气。一天，海燕对船长说：“暴风雨要来了，早点避风吧！”船长说：“现在晴空万里，风平浪静，哪里会有什么暴风雨！”于是，船长命令船只继续航行。又过了几个小时，好心的海燕再次飞过来提醒船长，说：“暴风雨马上就要来了，您赶紧到海湾避风吧！我也要找地方躲一下了。”船长说：“我的船很大，什么大风大浪没有见过，我才不怕呢！”没过多久，暴风雨果然来临，船被打翻了，船长抓着一块木板侥幸逃生。这时，他想起海燕的忠告，追悔莫及。",
                            @"马本来具有天生的素质，它的蹄子可以践踏霜雪，它的皮毛可以抵御风寒。它饿了吃草，渴了喝水，扬蹄奋起奔跑如飞好像腾云驾雾一样，这是自然赋于马的本性。宫殿般豪华的房屋和宽大的高台对于它来说都是无用的。但是由于伯乐的出现，马的景况就完全改变了。伯乐曾因善于识别千里马而闻名于世，后又从事训练马的行当，不久又成了远近闻名的训马高手。伯乐训马的办法很多，马只要到了他的手里就要采取了烙、饿、打、困的方法把马治服。所谓“烙”，就是为了把马的天生气势打下去，就用烧得火红火红的烙铁烙马，马被烙得遍体鳞伤，没了气力，然后修剪马毛，铲削马掌，烙上印号，这样经过训治，十分之二三的马就要死掉了；所谓“饿”，就是为了训练马的耐力，饿了不让马吃，渴了不让马喝；所谓“打”，就是为了调整马的奔跑速度和技巧，便时快时慢的控制它，用鞭子狠狠抽打，使马按照人的意图行进。所谓“困”，就是在马受了这些折磨以后，再把马关在马厩里，长期困乏它，经过伯乐的训治，马死一半以上。庄子说：“马在陆地上，吃草饮水；高兴时它们就摩擦颈项，表示亲爱；忿怒时，就背相对，互相踢蹋。马所晓得的已尽于此了。等到把驾马的横木加在马的身上，用遮眼的东西加在马的头上，使马的行止齐一，马方才知怎用眼睛斜看，不愿就范，曲颈不伸，欲脱其扼，甚至猛戾抵突，吐衔窃辔，而不驯服。所以使马晓得这些，失去了它们的本性，以致行动诡诈，近于盗贼的，都是伯乐训马造成的啊！”",nil];
}



//MARK:从这里设定TableView

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (SCREEN_WIDTH-40)*1.3+25;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MCell"];
    if (cell == nil) {
        cell = [[MainCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MCell"];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
        cell.shouldGroupAccessibilityChildren = YES;
    }
    cell.title_Label.text = self.titleString[indexPath.row];
    cell.content_Label.text = self.contentString[indexPath.row];
    NSString *pic_name = [NSString stringWithFormat:@"pic_%d",(int)indexPath.row];
    cell.background_imageView.image = [UIImage imageNamed:pic_name];
    cell.transform = CGAffineTransformMakeScale(1, 1);
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    currentIndexPath = indexPath;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [UIView animateWithDuration:0.2 animations:^{
        cell.transform = CGAffineTransformMakeScale(0.9, 0.9);
        NSLog(@"small");
    }];
    
    return YES;
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([currentIndexPath isEqual:indexPath]) {
        [UIView animateWithDuration:0.2 animations:^{
            cell.transform = CGAffineTransformMakeScale(1, 1);
            NSLog(@"back");
        }];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MainCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.transform = CGAffineTransformMakeScale(0.9, 0.9);
    CompletePage *ComPage = [[CompletePage alloc]init];
    ComPage.currentIndexPath = indexPath;
    ComPage.titleString = cell.title_Label.text;
    ComPage.contentString = cell.content_Label.text;
    ComPage.CompleteContent = self.completeContent[indexPath.row];
    ComPage.headImage = cell.background_imageView.image;
    [self.navigationController pushViewController:ComPage animated:YES];
}


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

    MainCell *cell = (MainCell *)[self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [toVC valueForKeyPath:@"headerImageView"];
    UIView *fromView = cell.background_View;
    UIView *containerView = [transitionContext containerView];
    UIView *snapShotView = [[UIImageView alloc]initWithImage:cell.background_imageView.image];
    snapShotView.frame = [containerView convertRect:fromView.frame fromView:fromView.superview];

    fromView.hidden = YES;

    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    toView.hidden = YES;

    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH-30, 30)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.font = [UIFont systemFontOfSize:25];
    titleLabel.text = cell.title_Label.text;

    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, (SCREEN_WIDTH-40)*1.3-30, SCREEN_WIDTH-44, 15)];
    contentLabel.font = [UIFont systemFontOfSize:15];
    contentLabel.textColor = [UIColor whiteColor];
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.alpha = 0.5;
    contentLabel.text =cell.content_Label.text;
    [snapShotView addSubview:titleLabel];
    [snapShotView addSubview:contentLabel];
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapShotView];

    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:1.0f options:UIViewAnimationOptionCurveLinear animations:^{
        [containerView layoutIfNeeded];
        toVC.view.alpha = 1.0f;
        snapShotView.frame = [containerView convertRect:toView.frame fromView:toView.superview];
        titleLabel.frame = CGRectMake(22, 30, SCREEN_WIDTH-30, 30);
        contentLabel.frame = CGRectMake(22, SCREEN_WIDTH*1.3-30, SCREEN_WIDTH*1.3-44, 15);

    } completion:^(BOOL finished) {

        toView.hidden = NO;
        fromView.hidden = NO;
        [snapShotView removeFromSuperview];
        [self.tableView reloadData];
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];

}

@end
