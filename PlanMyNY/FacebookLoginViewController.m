//
//  FacebookViewController.m
//  PlanMyNY
//
//  Created by Matt on 3/20/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import "FacebookLoginViewController.h"
#import "FacebookSDK/FacebookSDK.h"
#import "UserProfileViewController.h"

@interface FacebookLoginViewController ()

@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation FacebookLoginViewController

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user {
    self.profilePictureView.profileID = user.id;
    self.nameLabel.text = user.name;
    
    NSLog(@"ID: %@", user.id);
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    self.statusLabel.text = @"You're logged in as";
    
    NSLog(@"HERE!");
    
    NSLog(@"%@", self.navigationController);
    
    
    UserProfileViewController *profile = [[UserProfileViewController alloc] initWithNibName:@"UserProfileViewController" bundle:nil];
    profile.loginView = self.loginView;
    [self.navigationController pushViewController:profile animated:YES];
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    self.profilePictureView.profileID = nil;
    self.nameLabel.text = @"";
    self.statusLabel.text = @"You're not logged in!";
}

- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    NSString *alertMessage, *alertTitle;
    
    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        alertTitle = @"Facebook Error";
        alertMessage = [FBErrorUtility userMessageForError:error];
    }
    else if ([FBErrorUtility errorCategoryForError:error]) {
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid";
    }
    else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";
    }
    else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
        NSLog(@"user cancelled login");
    }
    else {
        alertTitle = @"Something went wrong";
        alertMessage = @"Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }
    
    if (alertMessage) {
        [[[UIAlertView alloc] initWithTitle:alertTitle message:alertMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.loginView = [[FBLoginView alloc] init];
        self.loginView.defaultAudience = FBSessionDefaultAudienceEveryone;
        self.loginView.readPermissions = @[@"basic_info", @"user_events"];
        self.loginView.publishPermissions = @[@"create_event"];
        self.loginView.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
