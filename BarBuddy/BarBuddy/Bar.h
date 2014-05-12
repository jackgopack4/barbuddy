//
//  Bar.h
//  BarBuddy
//
//  Created by Steven Volocyk on 5/7/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Drink.h"

@interface Bar : NSObject {
    NSString *_barName;
    NSString *_barOwner;
    NSString *_barHours;
    NSString *_barWebSite;
    NSString *_barEmail;
    NSMutableArray *_drinkList;
}

//@property (nonatomic, strong) NSString *barName;
//@property (nonatomic, strong) NSString *barOwner;
//@property (nonatomic, strong) NSString *barHours;
//@property (nonatomic, strong) NSString *barWebSite;
//@property (nonatomic, strong) NSString *barEmail;
//@property (nonatomic, strong) NSMutableArray *drinkList;

-(NSString *) getBarName;
-(NSString *) getBarOwner;
-(NSString *) getBarHours;
-(NSString *) getBarWebSite;
-(NSString *) getBarEmail;
-(NSMutableArray *) getBarDrinkList;


-(void) setBarName:(NSString *)barName;
-(void) setBarOwner:(NSString *)barOwner;
-(void) setBarHours:(NSString *)barHours;
-(void) setBarWebSite:(NSString *)barWebSite;
-(void) setBarEmail:(NSString *)barEmail;
-(void) setBarDrinkList:(NSMutableArray *)drinkList;

-(void) addDrink:(Drink *)drink;
-(void) removeDrink:(Drink *)drink;
-(void) removeDrinkAtIndex:(int)index;

@end
