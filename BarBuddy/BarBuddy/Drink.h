//
//  Drink.h
//  BarBuddy
//
//  Created by Steven Volocyk on 5/7/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Drink : NSObject {
    NSString *_drinkName;
    NSString *_drinkCost;
    NSString *_drinkDay;
}

//@property (nonatomic, strong) NSString *drinkName;
//@property (nonatomic, strong) NSString *drinkCost;
//@property (nonatomic, strong) NSString *drinkDay;

-(NSString *) getDrinkName;
-(NSString *) getDrinkCost;
-(NSString *) getDrinkDay;
-(NSString *) getFormattedDescription;

-(void) setDrinkName:(NSString *)drinkName;
-(void) setDrinkCost:(NSString *)drinkCost;
-(void) setDrinkDay:(NSString *)drinkDay;

@end
