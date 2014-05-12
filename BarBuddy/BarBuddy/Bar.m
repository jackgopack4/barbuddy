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
        
        _drinkList = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSString *) getBarName {
    return _barName;
}

-(NSString *) getBarOwner {
    return _barOwner;
}

-(NSString *) getBarHours {
    return _barHours;
}

-(NSString *) getBarWebSite {
    return _barWebSite;
}

-(NSString *) getBarEmail {
    return _barEmail;
}

-(NSMutableArray *) getBarDrinkList {
    return _drinkList;
}

-(void) setBarName:(NSString *)barName {
    
    _barName = barName;
    
}

-(void) setBarOwner:(NSString *)barOwner {
    
    _barOwner = barOwner;
}

-(void) setBarHours:(NSString *)barHours {
    
    _barHours = barHours;
}

-(void) setBarWebSite:(NSString *)barWebSite {
    
    _barWebSite = barWebSite;
}

-(void) setBarEmail:(NSString *)barEmail {
    
    _barEmail = barEmail;
}

-(void) setBarDrinkList:(NSMutableArray *)drinkList {
    
    _drinkList = drinkList;
    
}

-(void) addDrink:(Drink *)drink {
    
    [[self getBarDrinkList] addObject:drink];
}

-(void) removeDrink:(Drink *)drink {
    
    [[self getBarDrinkList] removeObject:drink];
}

-(void) removeDrinkAtIndex:(int)index {
    
    [[self getBarDrinkList] removeObjectAtIndex:index];
}

@end
