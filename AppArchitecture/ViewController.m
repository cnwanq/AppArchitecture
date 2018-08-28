//
//  ViewController.m
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/26.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "ViewController.h"
#import "MVCViewController.h"
#import "MVVMViewController.h"
#import "MVPViewController.h"
#import "CDDViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"UI 开发模式";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate/UITableViewDataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *controller;
    if (indexPath.row == 0) {
        // MVC
        MVCViewController *mvcController = [[MVCViewController alloc] initWithNibName:@"MVCViewController" bundle:nil];
     
        controller = mvcController;
    } else if (indexPath.row == 1) {
        // MVP
        MVPViewController *mvpController = [[MVPViewController alloc] init];
        
        controller = mvpController;
    } else if (indexPath.row == 2) {
        // MVVM
        MVVMViewController *mvvmController = [[MVVMViewController alloc] init];
        
        controller = mvvmController;
    } else if (indexPath.row == 3) {
        // CDD
        CDDViewController *cddController = [[CDDViewController alloc] init];
        
        controller = cddController;
    }
    
    if (controller) {
        [self.navigationController pushViewController:controller animated:YES];
    }
}


@end
