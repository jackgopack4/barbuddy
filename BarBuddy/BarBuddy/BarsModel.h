//
//  BarsModel.h
//  BarBuddy
//
//  Created by Steven Volocyk on 3/5/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BarsModelProtocol <NSObject>

- (void)itemsDownloaded:(NSArray *)items;

@end

@interface BarsModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<BarsModelProtocol> delegate;

- (void)downloadItems;

@end
