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

- (IBAction)locationLink:(id)sender {
    NSLog(@"YAY LOCATION!");
    
}

- (IBAction)eventLink:(id)sender {
    NSLog(@"YAY EVENT!");
}

- (IBAction)restaurantLink:(id)sender {
    NSURL *pageURL = [NSURL URLWithString:self.restaurant[@"website"]];
    NSLog(@"%@", pageURL);
    /*
    NSLog(@"YAY RESTAURANT!");
    UIViewController *webViewController = [[UIViewController alloc] init];
    UIWebView *myView = [[UIWebView alloc] init];
    myView.scalesPageToFit = YES;
    NSURL *pageURL = [NSURL URLWithString:self.restaurant[@"website"]];
    [myView loadRequest:[NSURLRequest requestWithURL:pageURL]];
    [webViewController.view addSubview: myView];
    [self.navigationController pushViewController:webViewController animated:YES];
     */
}

- (IBAction)eventSite:(id)sender {
    NSURL *pageURL = [NSURL URLWithString:self.event[@"link"]];
    NSLog(@"%@", pageURL);
    /*
    UIViewController *webViewController = [[UIViewController alloc] init];
    UIWebView *myView = [[UIWebView alloc] init];
    myView.scalesPageToFit = YES;
    NSURL *pageURL = [NSURL URLWithString:self.event[@"link"]];
    [myView loadRequest:[NSURLRequest requestWithURL:pageURL]];
    [webViewController.view addSubview: myView];
    [self.navigationController pushViewController:webViewController animated:YES];
     */
}

- (IBAction)restaurantSite:(id)sender {
    UIViewController *webViewController = [[UIViewController alloc] init];
    UIWebView *myView = [[UIWebView alloc] init];
    myView.scalesPageToFit = YES;
    NSURL *pageURL = [NSURL URLWithString:self.restaurant[@"website"]];
    [myView loadRequest:[NSURLRequest requestWithURL:pageURL]];
    [webViewController.view addSubview: myView];
    [self.navigationController pushViewController:webViewController animated:YES];
}

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
