//
//  ViewController.m
//  Cash_Register
//
//  Created by Kazi Tamanna
//  Copyright © 2019 Kazi Tamanna. All rights reserved.
//

#import "ViewController.h"
#import "Item.h"
#import "PurchaseHistory.h"
#import "ManagerViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLbl;
@property (weak, nonatomic) IBOutlet UIPickerView *invertoryPickerView;
@property (weak, nonatomic) IBOutlet UILabel *quantityLbl;

@property (nonatomic) NSMutableArray *items;
@property (nonatomic) Item *item;
@property (nonatomic) Item *buyingItem;
@property (nonatomic) int buyingQuantity;
@property (nonatomic) double totalPrice;
@property (weak, nonatomic) IBOutlet UILabel *errorMessageLbl;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad]; 
    self.navigationItem.title = @"Cash_Register";
    self.errorMessageLbl.numberOfLines = 4;
    self.errorMessageLbl.lineBreakMode = NSLineBreakByWordWrapping;
}
//initialize NSMutableArray items by call the Item's constructor;
-(NSMutableArray*)items {
    if (!_items) {
        Item* pants = [[Item alloc]initWithName:@"pants" price:109.99 quantity:5];
        Item* shoes = [[Item alloc]initWithName:@"shoes" price:300.99 quantity:10];
        Item* shirts = [[Item alloc]initWithName:@"shirts" price:99.99 quantity:10];
        Item* dress = [[Item alloc]initWithName:@"dress" price:499.99 quantity:10];
        
        _items = [[NSMutableArray alloc]initWithObjects:pants, shoes, shirts, dress, nil];
    }
    return _items;
}
//if clear button is pressed, set every label text empty;
- (IBAction)clearBtnPressed:(UIButton *)sender
{
    self.totalPriceLbl.text = @"";
    self.quantityLbl.text = @"";
    self.errorMessageLbl.text = @"";
}
//button pressed to choose the quantity and update the total price label
- (IBAction)numBtnPressed:(UIButton *)sender
{
    self.errorMessageLbl.text = @"";
    self.totalPriceLbl.text = @"";
    self.quantityLbl.text = [NSString  stringWithFormat:@"%@%@", self.quantityLbl.text, sender.titleLabel.text];
    self.buyingQuantity = [self.quantityLbl.text intValue];
   
    self.totalPrice = [self.buyingItem price] * self.buyingQuantity;
    self.totalPriceLbl.text = [NSString  stringWithFormat:@"%g", self.totalPrice];
}
// buy button pressed to buy the item and update the items array and labels accordingly;
- (IBAction)buyBtnPressed:(UIButton *)sender {
  
    int availableQuantity = [self.buyingItem quantity];
    int quantityLeft = availableQuantity - self.buyingQuantity;
    // if buying amout is larger than the available amount, the error will show;
    if (quantityLeft < 0){
        self.errorMessageLbl.text = [NSString stringWithFormat:@"available quantity is: %d", availableQuantity];
        return;
    }
    self.totalPrice = [self.buyingItem price] * self.buyingQuantity;
    [self.buyingItem setQuantity:quantityLeft];
    [self.invertoryPickerView reloadAllComponents];
    [self updatePurchaseArray];
     self.errorMessageLbl.text = @"";
}

-(void)updatePurchaseArray {
    NSDate *date = [NSDate date];
    PurchaseHistory *purchase = [[PurchaseHistory alloc] initWithName:self.nameLbl.text price:self.totalPrice quantity: self.buyingQuantity purchaseDate: date];
    if (!_purchaseArray) {
        _purchaseArray = [[NSMutableArray alloc]init];
    }
    [self.purchaseArray addObject: purchase];
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.items.count;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
   
    return [[self.items objectAtIndex: row] description];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.totalPriceLbl.text = @"";
    self.quantityLbl.text = @"";
    self.buyingQuantity = 0;
    self.buyingItem = [self.items objectAtIndex:row];
    self.nameLbl.text = self.buyingItem.name;
    double totalPrice = [self.buyingItem price] * self.buyingQuantity;
    self.totalPriceLbl.text = [NSString  stringWithFormat:@"%g", totalPrice];
 }

//segue to ManagerViewController and pass data;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
       if ([segue.identifier isEqualToString:  @"to_manager"])
           {
             ManagerViewController * targetVC = (ManagerViewController *)segue.destinationViewController;
             targetVC.purchases = self.purchaseArray;
               targetVC.items = self.items;
       }
 }
// reload the cash register picker view after restock;
-(void)viewWillAppear:(BOOL)animated
{
    [self.invertoryPickerView reloadAllComponents];
}
@end
