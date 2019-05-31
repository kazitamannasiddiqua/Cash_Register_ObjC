//
//  Item.m
//  Cash_Register
//
//  Created by Kazi Tamanna
//  Copyright © 2019 Kazi Tamanna. All rights reserved.
//

#import "Item.h"

@interface Item()

@property (nonatomic) double price;
@property (nonatomic) NSString *name;
@property (nonatomic) int quantity;
@end;

@implementation Item
@synthesize quantity = _quantity;

//costructor;
-(instancetype)initWithName: (NSString*)name
               price: (double) price
            quantity: (int) quantity
{
    self = [super init];
    if(self) {
       self.price = price;
       self.name = name;
       self.quantity = quantity;
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat: @"%@, %d, price: %f", self.name, self.quantity, self.price];
   
}

-(NSString*) name {
    return _name;
}
-(double) price {
    return _price;
}

-(int) quantity {
    return _quantity;
}
-(void) setQuantity: (int)quantity {
    _quantity = quantity;
}



@end
