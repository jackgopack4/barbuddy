//
//  Bar.h
//  BarBuddy
//
//  Created by Steven Volocyk on 5/7/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bar : NSObject

@property (nonatomic, strong) NSString *barName;
@property (nonatomic, strong) NSString *barOwner;
@property (nonatomic, strong) NSString *barHours;
@property (nonatomic, strong) NSString *barWebSite;
@property (nonatomic, strong) NSString *barEmail;
@property (nonatomic, strong) NSMutableArray *drinkList;

@end
