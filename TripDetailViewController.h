//
//  TripDetailViewController.h
//  PlanMyNY
//
//  Created by Matt on 3/21/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TripDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *locationImage;
@property (strong, nonatomic) IBOutlet UILabel *locationName;
@property (strong, nonatomic) IBOutlet UILabel *locationAddress;
@property (strong, nonatomic) IBOutlet UILabel *eventName;
@property (strong, nonatomic) IBOutlet UILabel *eventDescription;
@property (strong, nonatomic) IBOutlet UILabel *restaurantName;
@property (strong, nonatomic) IBOutlet UIImageView *restaurantImage;
@property (strong, nonatomic) IBOutlet UILabel *restaurantsName;
@property (strong, nonatomic) IBOutlet UILabel *restaurantAddress;
@property (strong, nonatomic) IBOutlet UILabel *eventAddress;

- (IBAction)locationLink:(id)sender;
- (IBAction)eventLink:(id)sender;
- (IBAction)restaurantLink:(id)sender;
- (IBAction)eventSite:(id)sender;
- (IBAction)restaurantSite:(id)sender;


@property (nonatomic, copy) NSDictionary *location;
@property (nonatomic, copy) NSDictionary *event;
@property (nonatomic, copy) NSDictionary *restaurant;

@end
