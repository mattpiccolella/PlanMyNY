//
//  TripDetailViewController.m
//  PlanMyNY
//
//  Created by Matt on 3/21/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import "TripDetailViewController.h"
#import "TripDetailWebViewController.h"

@interface TripDetailViewController ()

@property (nonatomic) TripDetailWebViewController *webView;

@end

@implementation TripDetailViewController

- (IBAction)locationLink:(id)sender {
    
}

- (IBAction)eventLink:(id)sender {
}

- (IBAction)restaurantLink:(id)sender {
}

- (IBAction)eventSite:(id)sender {
    NSURL *pageURL = [NSURL URLWithString:self.event[@"link"]];
    self.webView.title = self.event[@"name"];
    self.webView.URL = pageURL;
    [self.navigationController pushViewController:self.webView animated:YES];
}

- (IBAction)restaurantSite:(id)sender {
    NSURL *pageURL = [NSURL URLWithString:self.restaurant[@"website"]];
    self.webView.title = self.restaurant[@"name"];
    self.webView.URL = pageURL;
    [self.navigationController pushViewController:self.webView animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        TripDetailWebViewController *web = [[TripDetailWebViewController alloc] init];
        self.webView = web;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (self.location) {
        NSURL *imageURL = [NSURL URLWithString:self.location[@"photo"]];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        self.locationImage.image = [UIImage imageWithData:imageData];
        self.locationName.text = self.location[@"name"];
        self.locationAddress.text = self.location[@"address"];
    }
    else {
        self.locationName.text = @"Filler name";
        self.locationAddress.text = @"Filler address";
    }
    if (self.event) {
        self.eventName.text = self.event[@"name"];
        self.eventAddress.text = self.event[@"street_address"];
    }
    else {
        self.eventName.text = @"Filler name";
        self.eventDescription.text = @"Filler description";
    }
    if (self.restaurant) {
        NSURL *restaurantURL = [NSURL URLWithString:self.restaurant[@"photo"]];
        NSData *restaurantData = [NSData dataWithContentsOfURL:restaurantURL];
        self.restaurantImage.image = [UIImage imageWithData:restaurantData];
        self.restaurantsName.text = self.restaurant[@"name"];
        self.restaurantAddress.text = self.restaurant[@"address"];
    }
    else {
        self.restaurantsName.text = @"Filler name";
        self.restaurantAddress.text = @"Filler address";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
