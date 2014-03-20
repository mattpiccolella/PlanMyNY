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

@interface UserProfileViewController ()

@end

@implementation UserProfileViewController

- (void)viewWillAppear:(BOOL)animated {
    if (self.graphUser) {
        self.profilePicture.profileID = self.graphUser.id;
        self.userName.text = self.graphUser.name;
    }
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    NSLog(@"We shouldn't be here!");
    FacebookLoginViewController *login = [[FacebookLoginViewController alloc] initWithNibName: nil bundle:nil];
    [[UIApplication sharedApplication] delegate].window.rootViewController = login;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"User Profile";
        self.nameLabel.text = @"We got this!";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
