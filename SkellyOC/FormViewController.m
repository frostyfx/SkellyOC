//
//  FormViewController.m
//  SkellyOC
//
//  Created by Andrew Greteman on 4/24/17.
//  Copyright © 2017 frostyFX. All rights reserved.
//

#import "FormViewController.h"
#import "HomeViewController.h"
#import "TableViewController.h"
#import "ScrollViewController.h"

@interface FormViewController ()
@end

@implementation FormViewController
{

}

@synthesize myText = _myText;
@synthesize myDate = _myDate;
@synthesize resetButton = _resetButton;
@synthesize submitButton = _submitButton;



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
        ScrollViewController *tableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ScrollViewController"];
        [tableVC setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self.navigationController pushViewController:tableVC animated:YES];
    }
    
}

-(IBAction) buttonPressed: (id) sender {
    if ([sender isEqual:_resetButton]) {
        _myText.text = @"";
        
        //Resetting Date
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM dd yyyy"];
        NSDate *date = [formatter dateFromString:@"Jan 01 2000"];
        _myDate.date = date;
    }
    else if ([sender isEqual:_submitButton]) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM dd yyyy"];
        NSString *dateString = [formatter stringFromDate:_myDate.date];
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:_myText.text forKey:@"Username"];
        [prefs setObject:dateString forKey:@"Date"];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if ([prefs stringForKey:@"Username"]){
        _myText.text = [prefs stringForKey:@"Username"];
    }
    if ([prefs stringForKey:@"Date"]){
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM dd yyyy"];
        NSDate *date = [formatter dateFromString:[prefs stringForKey:@"Date"]];
        _myDate.date = date;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
