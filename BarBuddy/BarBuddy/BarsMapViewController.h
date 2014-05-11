//
//  BarsMapViewController.h
//  BarBuddy
//
//  Created by Tyler Slove on 5/10/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface BarsMapViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *BarsMapView;

@end
