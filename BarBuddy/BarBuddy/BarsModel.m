//
//  BarsModel.m
//  BarBuddy
//
//  Created by Steven Volocyk on 3/5/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import "BarsModel.h"
#import "Bar.h"
#import "Drink.h"

@interface BarsModel()
{
    NSMutableData *_downloadedData;
}
@end

@implementation BarsModel

- (void)downloadItems
{
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://54.200.71.33/service/mysql_interface.php"];
    
    // Create the request
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:jsonFileUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15.0];
    
    //NSURLConnection *connection= [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    
    [urlRequest setHTTPMethod:@"POST"];
    NSString *postString = @"rdf=1&city=Madison&state=Wisconsin";
    [urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
    
}

#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    _downloadedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [_downloadedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    NSMutableArray *_barInformation = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    
    NSMutableArray *barList = [[NSMutableArray alloc] init];
    
    // Loop through JSON objects, build bar list
    NSEnumerator *barEnumerator = [dataDictionary objectEnumerator];
    NSDictionary *barElement;
    
    while (barElement = [barEnumerator nextObject]) {
        
        NSLog(@"data %@", barElement);
        // initialize the new bar
        Bar *newBar = [[Bar alloc] init];
        
        // grab the bar's meta data
        newBar.barName = [[barElement objectForKey:@"bar_info"] objectForKey:@"name"];
        newBar.barOwner =[[barElement objectForKey:@"bar_info"] objectForKey:@"owner"];
        newBar.barHours =[[barElement objectForKey:@"bar_info"] objectForKey:@"hours"];
        newBar.barEmail =[[barElement objectForKey:@"bar_info"] objectForKey:@"email"];
        newBar.barWebSite =[[barElement objectForKey:@"bar_info"] objectForKey:@"website"];
        
        NSEnumerator *drinkEnumerator = [[barElement objectForKey:@"bar_drinks"] objectEnumerator];
        NSDictionary *drinkElement;
        
        while (drinkElement = [drinkEnumerator nextObject]) {
            Drink *newDrink = [[Drink alloc] init];
            newDrink.drinkName = [drinkElement objectForKey:@"drink_name"];
            newDrink.drinkCost = [drinkElement objectForKey:@"drink_cost"];
            newDrink.drinkDay = [drinkElement objectForKey:@"drink_day"];
            [newBar.drinkList addObject:newDrink];
        }
        
        [barList addObject:newBar];
        
        //NSLog(@"name = %@", newBar.barName);
        //NSLog(@"owner = %@", newBar.barOwner);
        //NSLog(@"hours = %@", newBar.barHours);
        //NSLog(@"email = %@", newBar.barEmail);
        //NSLog(@"site = %@", newBar.barWebSite);
    }
    
    NSLog(@"data %@", barList);
    
    // Ready to notify delegate that data is ready and pass back items
    //if (self.delegate)
    //{
    //    [self.delegate itemsDownloaded:_barInformation];
    //}
}

@end

