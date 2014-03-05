//
//  BarCell.h
//  BarBuddy
//
//  Created by Steven Volocyk on 3/5/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *barName;

@property (weak, nonatomic) IBOutlet UILabel *distance;

@end
