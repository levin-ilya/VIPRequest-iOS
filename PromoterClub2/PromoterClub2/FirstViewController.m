//
//  FirstViewController.m
//  PromoterClub2
//
//  Created by ILYA LEVIN on 5/11/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize formTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.formTableView = self.formUIView.subviews[0];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
