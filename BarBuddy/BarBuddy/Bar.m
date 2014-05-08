//
//  Bar.m
//  BarBuddy
//
//  Created by Steven Volocyk on 5/7/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import "Bar.h"

@implementation Bar

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        self.drinkList = [[NSMutableArray alloc] init];
    }
    
    return self;
}


@end
