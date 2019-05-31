//
//  RestockViewController.m
//  Cash_Register
//
//  Created by Kazi Tamanna
//  Copyright © 2019 Kazi Tamanna. All rights reserved.
//

#import "RestockViewController.h"
#import "Item.h"

@interface RestockViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *restockTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) Item* item;

@end

@implementation RestockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//dismiss the keyboard;
- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self.restockTextField resignFirstResponder];
}
// update the items array and reload data in the tableview;
- (IBAction)okBtnPressed:(UIButton *)sender {
    int addQuantity = [self.restockTextField.text intValue];
    int currentQuantity = [self.item quantity] + addQuantity;
    [self.item setQuantity:currentQuantity];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.items objectAtIndex:indexPath.row] description];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.item = [self.items objectAtIndex: indexPath.row];
    self.navigationItem.title = [self.item name];
}

@end
