//
//  TripDetailViewController.h
//  PlanMyNY
//
//  Created by Matt on 3/21/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TripDetailViewController : UIViewController

@property (strong, nonatomic) NSDictionary *location;
@property (strong, nonatomic) NSDictionary *event;
@property (strong, nonatomic) NSDictionary *restaurant;

@property (strong, nonatomic) IBOutlet UILabel *locationName;
@property (strong, nonatomic) IBOutlet UILabel *eventName;
@property (strong, nonatomic) IBOutlet UILabel *restaurantName;

@end
