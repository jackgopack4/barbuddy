//
//  BarViewController.m
//  BarBuddy
//
//  Created by Steven Volocyk on 4/6/14.
//  Copyright (c) 2014 Steven Volocyk. All rights reserved.
//

#import "BarViewController.h"

@interface BarViewController ()

@end

@implementation BarViewController

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
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    //UIBarButtonItem *cameraItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
    
    NSArray *actionButtonItems = @[shareItem];
    self.navigationItem.rightBarButtonItems = actionButtonItems;
    
    // Do any additional setup after loading the view.
    
    self.drinkTableView.delegate = self;
    self.drinkTableView.dataSource = self;
    
    
    [self.selectedBarName setText:[self.selectedBar getBarName]];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [[self.selectedBar getBarDrinkList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DrinkCell *cell = [tableView dequeueReusableCellWithIdentifier:@"drinkCell"];
    
    if (cell == nil) {
        cell = [[DrinkCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"drinkCell"];
    }
    
    // Grab the bar that matches this cell
    Drink *drink = [[self.selectedBar getBarDrinkList] objectAtIndex:indexPath.row];
    
    // Fill the cell with pertinent data
    [cell.drinkDescription setText:[drink getFormattedDescription]];
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
