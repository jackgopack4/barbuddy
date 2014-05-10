//
//  BarsViewController.m
//  BarBuddy
//
//  Created by Steven Volocyk on 3/5/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import "BarsViewController.h"
#import "BarViewController.h"

#import "BarsModel.h"
#import "BarCell.h"
#import "Bar.h"

@interface BarsViewController () {
    BarsModel *_bars;
    NSArray *_feedItems;
    Bar *_selectedBar;
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
    
    // Set this view controller object as the delegate and data source for the table view
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    
    // Create array object and assign it to _feedItems variable
    _feedItems = [[NSArray alloc] init];
    
    // Create BarModel object and set it as the delegate for bar model object
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
    _feedItems = items;
    
    // Reload the table view
    [self.listTableView reloadData];
}


#pragma mark Table Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Default behavior
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // The number of cells that need to be created
    return _feedItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[BarCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    // Grab the bar that matches this cell
    Bar *bar = [_feedItems objectAtIndex:indexPath.row];
    
    // Fill the cell with pertinent data
    [cell.barName setText:bar.barName];
    
    return cell;
}

#pragma mark - Tableview Data Source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedBar = [_feedItems objectAtIndex:indexPath.row];

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Manually call segue to detail view controller
    [self performSegueWithIdentifier:@"barSegue" sender:self];
}

#pragma mark Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get reference to the destination view controller
    BarViewController *barVC = segue.destinationViewController;

    // Set the property to the selected bar so new view can use the object
    barVC.selectedBar = _selectedBar;
}

@end
