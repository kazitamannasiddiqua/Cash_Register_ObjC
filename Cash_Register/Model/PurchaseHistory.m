//
//  PurchaseHistory.m
//  Cash_Register
//
//  Created by Kazi Tamanna
//  Copyright © 2019 Kazi Tamanna. All rights reserved.
//

#import "PurchaseHistory.h"

@implementation PurchaseHistory

-(instancetype) initWithName:(NSString *)name price:(double)totalPrice quantity:(int)quantity purchaseDate: (NSDate*) date
{
    self = [super initWithName:name price: totalPrice quantity: quantity];
    if(self) {
       self.purchaseDate = date;
    }
    return self;
}

-(NSString*) description
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE MMM dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:self.purchaseDate];
    return [NSString stringWithFormat:@"%@", dateString];
}
@end
