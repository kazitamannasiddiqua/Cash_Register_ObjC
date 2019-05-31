//
//  CALayer+UIoperation.h
//  Cash_Register
//
//  Created by Kazi Tamanna
//  Copyright © 2019 Kazi Tamanna. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE

@interface CALayer (UIoperation)
@property (nonatomic) IBInspectable UIColor
        *borderNewColor;
@property (nonatomic) IBInspectable CGFloat            cornerNewRadius;
@property (nonatomic) IBInspectable CGFloat             borderNewWidth;
@end

NS_ASSUME_NONNULL_END
