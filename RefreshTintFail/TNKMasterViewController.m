//
//  TNKMasterViewController.m
//  RefreshTintFail
//
//  Created by David Beck on 4/8/14.
//  Copyright (c) 2014 ThinkUltimate. All rights reserved.
//

#import "TNKMasterViewController.h"


@interface TNKMasterViewController ()

@end

@implementation TNKMasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self refresh:self.refreshControl];
    
    self.tableView.contentOffset = CGPointMake(0.0, -self.tableView.contentInset.top);
}

- (IBAction)refresh:(id)sender
{
    [self.refreshControl beginRefreshing];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        [self.refreshControl endRefreshing];
    });
}

@end
