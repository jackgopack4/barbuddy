//
//  MapPin.m
//  BarBuddy
//
//  Created by Tyler Slove on 5/10/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import "MapPin.h"

@implementation MapPin

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

-(id)initWithPosition:(CLLocationCoordinate2D)coords {
    if (self = [super init]) {
        self.coordinate = coords;
    }
    return self;
}

@end
