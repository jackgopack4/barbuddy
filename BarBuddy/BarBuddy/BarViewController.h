//
//  BarViewController.h
//  BarBuddy
//
//  Created by Steven Volocyk on 4/6/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import "BarViewController.h"
#import "Bar.h"
#import "Drink.h"

#import <UIKit/UIKit.h>

@interface BarViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *barView;

@property (weak, nonatomic) IBOutlet UILabel *selectedBarName;

@property (weak, nonatomic) IBOutlet UITextView *selectedBarHours;

@property (weak, nonatomic) IBOutlet UILabel *selectedBarWebsite;

@property (weak, nonatomic) IBOutlet UIImageView *selectedBarImage;

@property (weak, nonatomic) IBOutlet UITableView *drinkTableView;

@property (strong, nonatomic) Bar *selectedBar;


@end
