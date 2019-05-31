//
//  ViewController.h
//  Cash_Register
//
//  Created by Kazi Tamanna
//  Copyright © 2019 Kazi Tamanna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//for purchase record
@property (nonatomic) NSMutableArray *purchaseArray;
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;

@end

