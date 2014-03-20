//
//  UserProfileViewController.h
//  PlanMyNY
//
//  Created by Matt on 3/20/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface UserProfileViewController : UIViewController <FBLoginViewDelegate>

@property (strong, nonatomic) IBOutlet FBLoginView *loginView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic) id<FBGraphUser> graphUser;
@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePicture;
@property (strong, nonatomic) IBOutlet UILabel *userName;
- (IBAction)planEvent:(id)sender;
- (IBAction)currentTrips:(id)sender;

@end
