//
//  UserProfileViewController.m
//  PlanMyNY
//
//  Created by Matt on 3/20/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import "UserProfileViewController.h"
#import "FacebookSDK/FacebookSDK.h"
#import "FacebookLoginViewController.h"
#import "TripDetailViewController.h"


@interface UserProfileViewController ()

@property (nonatomic) NSURLSession *session;

@end

@implementation UserProfileViewController

- (IBAction)planEvent:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://api.mattpic.com/v1.0/random_trip"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    self.indicator.hidden = NO;
    [self.indicator startAnimating];
    self.indicator.hidesWhenStopped = YES;
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        TripDetailViewController *tripDetail = [[TripDetailViewController alloc] initWithNibName:nil bundle:nil];
        tripDetail.location = jsonObject[@"location"];
        tripDetail.event = jsonObject[@"event"];
        tripDetail.restaurant = jsonObject[@"restaurant"];
        NSLog(@"We're here now!");
        NSLog(@"%@", jsonObject);
        [self.indicator performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.navigationController pushViewController:tripDetail animated:YES];
        });
    }];
    NSLog(@"Is this where we are?");
    [task resume];
}

- (IBAction)currentTrips:(id)sender {
    NSLog(@"To be implemented later...");
}

- (void)viewWillAppear:(BOOL)animated {

}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    FacebookLoginViewController *login = [[FacebookLoginViewController alloc] initWithNibName: nil bundle:nil];
    [[UIApplication sharedApplication] delegate].window.rootViewController = login;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"User Profile";
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (self.graphUser) {
        self.profilePicture.profileID = self.graphUser.id;
        self.userName.text = self.graphUser.name;
    }
    self.indicator.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
