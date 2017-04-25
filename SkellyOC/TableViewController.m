//
//  TableViewController.m
//  SkellyOC//
//  Created by Andrew Greteman on 4/20/17.
//  Copyright © 2017 frostyFX. All rights reserved.
//

#import "TableViewController.h"
#import "TableCell.h"
#import "HomeViewController.h"
#import "ScrollViewController.h"
#import "FormViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController
{
    NSArray *names;
    NSArray *descriptions;
    NSArray *ballPics;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [names count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentefier = @"tableCell";
    
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentefier];
    
    if (cell == nil) {
        cell = [[TableCell alloc] initWithDelegate:(id)self reuseIdentifier:(NSString *)cellIdentefier];
    }
    
    cell.nameLabel.text = [names objectAtIndex:indexPath.row];
    cell.descriptionLabel.text = [descriptions objectAtIndex:indexPath.row];
    cell.ballImageView.image = [UIImage imageNamed:[ballPics objectAtIndex:indexPath.row]];
    
    
    return cell;
}

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
        FormViewController *formVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FormViewController"];
        [formVC setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self.navigationController pushViewController:formVC animated:YES];
    }
    if (item.tag == 3){
        ScrollViewController *scrollVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ScrollViewController"];
        [scrollVC setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self.navigationController pushViewController:scrollVC animated:YES];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    names = [NSArray arrayWithObjects:@"Red Ball", @"Blue Ball", @"Green Ball", @"Yellow Ball", @"Purple Ball", nil];
    ballPics = [NSArray arrayWithObjects:@"redBall.png", @"blueBall.png", @"greenBall.png", @"yellowBall.png", @"purpleBall.png", nil];
    descriptions = [NSArray arrayWithObjects:@"This is a red ball.", @"This is a blue ball.", @"This is a green ball.", @"This is a yellow ball.", @"This is a purple ball." ,nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
