//
//  Drink.m
//  BarBuddy
//
//  Created by Steven Volocyk on 5/7/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import "Drink.h"

@implementation Drink

-(NSString *) getDrinkName {
    
    return [NSString stringWithFormat:@"%@",_drinkName];
    
}

-(NSString *) getDrinkCost {
    
    return [NSString stringWithFormat:@"%@",_drinkCost];

}

-(NSString *) getDrinkDay {
    
    switch ([_drinkDay intValue]) {
        case 1:
            return [NSString stringWithFormat:@"Monday"];
            break;
        case 2:
            return [NSString stringWithFormat:@"Tuesday"];
            break;
        case 3:
            return [NSString stringWithFormat:@"Wednesday"];
            break;
        case 4:
            return [NSString stringWithFormat:@"Thursday"];
            break;
        case 5:
            return [NSString stringWithFormat:@"Friday"];
            break;
        case 6:
            return [NSString stringWithFormat:@"Saturday"];
            break;
        case 7:
            return [NSString stringWithFormat:@"Sunday"];
            break;
        default:
            return [NSString stringWithFormat:@"Error"];
            break;
    }
    
}

-(NSString *) getFormattedDescription {
    
    NSString *description;
    if ([[self getDrinkCost] isEqualToString:@"0"]) {
        description = [NSString stringWithFormat:@"%@",[self getDrinkName]];
        
    }
    else if ([[self getDrinkCost] length] == 1) {
        description = [NSString stringWithFormat:@"$%@.00 %@",[self getDrinkCost],[self getDrinkName]];
    }
    else if ([[self getDrinkCost] length] == 3) {
        description = [NSString stringWithFormat:@"$%@0 %@",[self getDrinkCost],[self getDrinkName]];
    }
    else {
        description = [NSString stringWithFormat:@"$%@ %@",[self getDrinkCost],[self getDrinkName]];
        
    }
    
    return description;
}

@end
