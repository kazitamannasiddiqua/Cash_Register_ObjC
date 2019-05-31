//
//  PurchaseHistoryTableViewController.h
//  Cash_Register
//
//  Created Kazi Tamanna
//  Copyright © 2019 Kazi Tamanna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PurchaseHistory.h"

NS_ASSUME_NONNULL_BEGIN

@interface PurchaseHistoryTableViewController : UITableViewController
@property (nonatomic) NSMutableArray *purchases;
@property(nonatomic) PurchaseHistory* singlePurchase;
-(NSMutableArray*) purchases;
-(void)setPurchases:(NSMutableArray *)purchases;

@end

NS_ASSUME_NONNULL_END
