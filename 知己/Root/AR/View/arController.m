//
//  arController.m
//  知己
//
//  Created by 周天荣 on 2019/5/29.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "arController.h"
#import <ARKit/ARKit.h>
#import <SceneKit/SceneKit.h>
@interface arController ()<ARSCNViewDelegate>

//AR视图：展示3D界面
@property (nonatomic, strong)ARSCNView *arSCNView;
//AR会话，负责管理相机追踪配置及3D相机坐标
@property(nonatomic,strong)ARSession *arSession;
//会话追踪配置
@property(nonatomic,strong)ARConfiguration *arSessionConfiguration;
//Node节点对象
@property(strong,nonatomic)SCNNode *sunNode;

@end

@implementation arController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    
    UIButton* back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.backgroundColor = [UIColor greenColor];
    back.frame = CGRectMake((self.view.bounds.size.width-100)/2, self.view.bounds.size.height - 100, 100, 50);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
}

- (void)onClick:(id)sender{
    //    返回
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self.view addSubview:self.arSCNView];
    //    添加ar视图
    self.arSCNView.delegate = self;
    //    添加代理
    [self.arSession runWithConfiguration:self.arSessionConfiguration];
    //    运行ar
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (ARConfiguration *)arSessionConfiguration
{
    if (!_arSessionConfiguration) {
        //1.创建世界追踪会话配置
        ARWorldTrackingConfiguration *configuration = [[ARWorldTrackingConfiguration alloc] init];
        //2.设置追踪方向
        configuration.planeDetection = ARPlaneDetectionHorizontal;
        _arSessionConfiguration = configuration;
        //3.自适应灯光
        _arSessionConfiguration.lightEstimationEnabled = YES;
    }
    return _arSessionConfiguration;
    
}

- (ARSession *)arSession
{
    if(!_arSession) {
       _arSession = [[ARSession alloc] init];
    }
    return _arSession;
}


- (ARSCNView *)arSCNView
{
    if (!_arSCNView) {
        _arSCNView = [[ARSCNView alloc] initWithFrame:self.view.bounds];
        SCNScene *scene = [SCNScene sceneNamed:@"ZTRSceneKitScene.scn"];
        _arSCNView.allowsCameraControl = YES;
        _arSCNView.scene = scene;
        _arSCNView.session = self.arSession;
        _arSCNView.automaticallyUpdatesLighting = YES;
    }
    return _arSCNView;
}

- (void)session:(ARSession *)session didUpdateFrame:(ARFrame *)frame {
    
}
    
@end
