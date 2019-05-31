//
//  PurchaseDetailsViewController.m
//  Cash_Register
//
//  Created by Kazi Tamanna
//  Copyright © 2019 Kazi Tamanna All rights reserved.
//

#import "PurchaseDetailsViewController.h"

@interface PurchaseDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *quantityLbl;
@property (weak, nonatomic) IBOutlet UILabel *totalCostLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;

@end

@implementation PurchaseDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLbl.text = [self.singlePurchase name];
    self.quantityLbl.text = [NSString  stringWithFormat:@"%d", [self.singlePurchase quantity]];
    self.totalCostLbl.text = [NSString  stringWithFormat:@"%g", [self.singlePurchase price]];
    self.dateLbl.text = [self.singlePurchase description];
}
//dismiss the current viewcontroller when done button is pressed;
- (IBAction)doneBtnPressed:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
