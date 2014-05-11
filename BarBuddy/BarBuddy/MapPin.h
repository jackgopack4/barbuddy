//
//  MapPin.h
//  BarBuddy
//
//  Created by Tyler Slove on 5/10/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapPin : NSObject <MKAnnotation>

//coordinate
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
//title
@property (nonatomic, copy) NSString *title;
//subtitle
@property (nonatomic, copy) NSString *subtitle;

-initWithPosition:(CLLocationCoordinate2D)coords;

@end
