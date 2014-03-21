//
//  TripDetailViewController.m
//  PlanMyNY
//
//  Created by Matt on 3/21/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import "TripDetailViewController.h"

@interface TripDetailViewController ()

@end

@implementation TripDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (self.location) {
        self.locationName.text = self.location[@"name"];
    }
    else {
        self.locationName.text = @"ERROR";
    }
    if (self.event) {
        self.eventName.text = self.event[@"name"];
    }
    else {
        self.locationName.text = @"ERRROR";
    }
    if (self.restaurant) {
        self.restaurantName.text = self.restaurant[@"name"];
    }
    else {
        self.restaurantName.text = @"ERROR";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
