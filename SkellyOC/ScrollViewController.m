//
//  ScrollViewController.m
//  SkellyOC
//
//  Created by Andrew Greteman on 4/20/17.
//  Copyright © 2017 frostyFX. All rights reserved.
//

#import "ScrollViewController.h"
#import "HomeViewController.h"
#import "TableViewController.h"
#import "FormViewController.h"


@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if (item.tag == 0) {
        HomeViewController *homeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        [homeVC setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    if (item.tag == 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    if (item.tag == 2){
        TableViewController *tableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TableViewController"];
        [tableVC setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self.navigationController pushViewController:tableVC animated:YES];
    }
    if (item.tag == 3){
        FormViewController *formVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FormViewController"];
        [formVC setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self.navigationController pushViewController:formVC animated:YES];

    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
