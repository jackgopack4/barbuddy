//
//  LoginViewController.h
//  BarBuddy
//
//  Created by John Peterson on 5/7/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface LoginViewController : UIViewController<FBLoginViewDelegate> {
    

}
@property (weak, nonatomic) IBOutlet FBLoginView *loginView;

@end
