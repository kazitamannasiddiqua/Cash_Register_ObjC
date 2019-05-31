//
//  ManagerViewController.m
//  Cash_Register
//
//  Created by Kazi Tamanna
//  Copyright © 2019 Kazi Tamanna. All rights reserved.
//

#import "ManagerViewController.h"
#import "PurchaseHistoryTableViewController.h"
#import "RestockViewController.h"

@interface ManagerViewController ()

@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Manager";
 }

// segue to PurchaseHistoryTableViewController or RestockViewController according to the segue identifier, and pass data;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
     if ([segue.identifier isEqualToString:  @"to_purchase_history"])
     {
        PurchaseHistoryTableViewController * targetVC = (PurchaseHistoryTableViewController *)segue.destinationViewController;      
        targetVC.purchases = self.purchases;
     }
 
    if ([segue.identifier isEqualToString:  @"restock"])
     {
        NSLog(@"entered to restock");
        RestockViewController * targetVCstock = (RestockViewController *)segue.destinationViewController;
        targetVCstock.items = self.items;
     }
    
}
@end
