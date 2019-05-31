//
//  PurchaseHistoryTableViewController.m
//  Cash_Register
//
//  Created by Kazi Tamanna
//  Copyright © 2019 Kazi Tamanna. All rights reserved.
//

#import "PurchaseHistoryTableViewController.h"
#import "PurchaseHistory.h"
#import "ViewController.h"
#import "PurchaseDetailsViewController.h"

// set up the tableviewcontroller to view purchase history;
@interface PurchaseHistoryTableViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation PurchaseHistoryTableViewController
@synthesize purchases = _purchases;
- (void)viewDidLoad {
    [super viewDidLoad];
 }

-(NSMutableArray*) purchases{
   
    if (!_purchases) {
        _purchases = [[NSMutableArray alloc]init];
    }
    return _purchases;
}
-(void) setPurchases:(NSMutableArray *)purchases {
    _purchases = purchases;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.purchases.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.purchases objectAtIndex:indexPath.row] name];
    int quantity = [[self.purchases objectAtIndex:indexPath.row] quantity];
    NSString *quantityStr = [NSString stringWithFormat:@"%d", quantity];
    cell.detailTextLabel.text = quantityStr;
    
    return cell;
}
// when a purchase is selected, segue(modally) to PurchaseDetailsViewController and view its details;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.singlePurchase = [self.purchases objectAtIndex: indexPath.row];
    [self performSegueWithIdentifier:@"purchase_detail" sender:self];
}
#pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
     PurchaseDetailsViewController* targetVC = [segue destinationViewController];
     targetVC.singlePurchase = self.singlePurchase;
 }

@end
