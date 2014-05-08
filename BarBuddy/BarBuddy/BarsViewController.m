//
//  BarsViewController.m
//  BarBuddy
//
//  Created by Steven Volocyk on 3/5/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import "BarsViewController.h"
#import "BarsModel.h"
#import "BarCell.h"

@interface BarsViewController () {
    BarsModel *_bars;
}

@end

@implementation BarsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    //UIBarButtonItem *cameraItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
    
    //NSArray *actionButtonItems = @[shareItem, cameraItem];
    //self.navigationItem.rightBarButtonItems = actionButtonItems;
    
    _bars = [[BarsModel alloc] init];
    
    _bars.delegate = self;
    
    [_bars downloadItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)itemsDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    //_feedItems = items;
    
    // Reload the table view
    //[self.listTableView reloadData];
}


#pragma mark Table Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //TODO: MAKE THIS DYNAMIC BASED ON BARS LIST LENGTH
    //Merge test
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[BarCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    // TODO: FILL THE CELL WITH DATA FROM SERVER
    
    // TODO: SET LABELS BASED ON DATA
    [cell.barName setText:@"Test Bar"];
    [cell.distance setText:@"Distance"];
    
    return cell;
}

#pragma mark - Tableview Data Source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
