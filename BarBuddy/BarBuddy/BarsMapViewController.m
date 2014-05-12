//
//  BarsMapViewController.m
//  BarBuddy
//
//  Created by Tyler Slove on 5/10/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import "BarsMapViewController.h"
#import <MapKit/MapKit.h>
#import "MapPin.h"

// Madison
    #define MADISON_LATITUDE 43.072906
    #define MADISON_LONGITUDE -89.396119
    
    #define SPAN_VALUE 0.030f


@implementation BarsMapViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.BarsMapView setDelegate: self];
    
	// Do any additional setup after loading the view.
    self.BarsMapView.mapType=0;
    
    //region
    MKCoordinateRegion region;
    
    //center
    CLLocationCoordinate2D center;
    center.latitude = MADISON_LATITUDE;
    center.longitude = MADISON_LONGITUDE;
    
    //span
    MKCoordinateSpan span;
    span.latitudeDelta = SPAN_VALUE;
    
    //assign region to map
    region.center = center;
    region.span = span;
    
    [self.BarsMapView setRegion:region animated:YES];
    
    
    //Adding Bar Pins
    
    NSMutableArray *barPinsArray = [[NSMutableArray alloc] init];
    CLLocationCoordinate2D location;
    MapPin *pin;
    
    
    //Wando's [x]
    
    location.latitude = 43.073431;
    location.longitude = -89.395987;
    //annotation
    pin = [[MapPin alloc] initWithPosition:location];
    pin.title = @"Wando's";
    pin.subtitle = @"602 University Ave";
    //add to array
    [barPinsArray addObject: pin];
    
    //Nitty Gritty [x]
    location.latitude = 43.071812;
    location.longitude = -89.395612;
    //annotation
    pin = [[MapPin alloc] initWithPosition:location];
    pin.title = @"Nitty Gritty";
    pin.subtitle = @"223 N Frances St";
    //add to array
    [barPinsArray addObject: pin];
    
    //Jordan's [x]
    location.latitude = 43.068041;
    location.longitude = -89.408245;
    //annotation
    pin = [[MapPin alloc] initWithPosition:location];
    pin.title = @"Jordan's Big 10 Pub";
    pin.subtitle = @"1330 Regent St";
    //add to array
    [barPinsArray addObject: pin];
    
    //Chaser's [x]
    location.latitude = 43.074266;
    location.longitude = -89.392259;
    //annotation
    pin = [[MapPin alloc] initWithPosition:location];
    pin.title = @"Chaser's";
    pin.subtitle = @"319 W Gorham St";
    //add to array
    [barPinsArray addObject: pin];
    
    //Kollege Klub [x]
    location.latitude = 43.075552;
    location.longitude = -89.397328;
    //annotation
    pin = [[MapPin alloc] initWithPosition:location];
    pin.title = @"Kollege Klub";
    pin.subtitle = @"529 N Lake St";
    //add to array
    [barPinsArray addObject: pin];
    
    //Red Shed [x]
    location.latitude = 43.073570;
    location.longitude = -89.396101;
    //annotation
    pin = [[MapPin alloc] initWithPosition:location];
    pin.title = @"Red Shed";
    pin.subtitle = @"406 N Frances St";
    //add to array
    [barPinsArray addObject: pin];
    
    //Church Key [x]
    location.latitude = 43.073527;
    location.longitude = -89.397051;
    //annotation
    pin = [[MapPin alloc] initWithPosition:location];
    pin.title = @"Church Key";
    pin.subtitle = @"626 University Ave";
    //add to array
    [barPinsArray addObject: pin];
    
    //Red Rock [x]
    location.latitude = 43.074154;
    location.longitude = -89.391323;
    //annotation
    pin = [[MapPin alloc] initWithPosition:location];
    pin.title = @"Red Rock";
    pin.subtitle = @"322 W Johnson St";
    //add to array
    [barPinsArray addObject: pin];
    
    //Old Fashioned [x]
    location.latitude = 43.076277;
    location.longitude = -89.383534;
    //annotation
    pin = [[MapPin alloc] initWithPosition:location];
    pin.title = @"The Old Fashioned";
    pin.subtitle = @"23 N Pinckney St";
    //add to array
    [barPinsArray addObject: pin];
    
    //Buckingham's [x]
    location.latitude = 43.067834;
    location.longitude = -89.399631;
    //annotation
    pin = [[MapPin alloc] initWithPosition:location];
    pin.title = @"Buckingham's";
    pin.subtitle = @"802 Regent St";
    //add to array
    [barPinsArray addObject: pin];
    
    //Tiki Shack [x]
    location.latitude = 43.074917;
    location.longitude = -89.387658;
    //annotation
    pin = [[MapPin alloc] initWithPosition:location];
    pin.title = @"Tiki Shack";
    pin.subtitle = @"128 State St";
    //add to array
    [barPinsArray addObject: pin];
    
    [self.BarsMapView addAnnotations: barPinsArray];
    
}

//Customizing Pins
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if (annotation == mapView.userLocation) return nil;
        
    else{
        
    
    //view
    MKPinAnnotationView *view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar.png"]];
    view.leftCalloutAccessoryView = imageView;
    view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
    view.image = [UIImage imageNamed:@"bar.png"]; //Changes pin image (not working)
    //enabled animated
    view.enabled = YES;
    view.animatesDrop = NO;
    view.canShowCallout = YES;
    //image button
    
    return view;
    }
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *) userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 500,500);
    [self.BarsMapView setRegion: region animated: YES];
}

//Annotation button functionality TESTING/DEBUG
- (void)mapView:(MKMapView *)mapView
     annotationView:(MKAnnotationView *)view
calloutAccessoryControlTapped:(UIControl *)control
{
    //annotation
    MapPin *pin = (MapPin *)view.annotation;
    //deselect
    [self.BarsMapView deselectAnnotation:pin animated:YES];
    //alert location
    NSString *msg = [@"Coords " stringByAppendingFormat:@"%f %f", pin.coordinate.latitude, pin.coordinate.longitude];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
