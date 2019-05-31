//
//  PurchaseHistory.h
//  Cash_Register
//
//  Created by Kazi Tamanna
//  Copyright © 2019 Kazi Tamanna. All rights reserved.
//

#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface PurchaseHistory : Item

@property (nonatomic) NSDate *purchaseDate;

-(instancetype) initWithName:(NSString *)name price:(double)totalPrice quantity:(int)quanity purchaseDate: (NSDate*) date;

-(NSString*) description;

@end

NS_ASSUME_NONNULL_END
