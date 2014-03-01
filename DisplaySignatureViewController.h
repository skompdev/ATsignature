//
//  DisplaySignatureViewController.h
//  awstest
//
//  Created by skompdev on 2/27/14.
//  Copyright (c) 2014 Organization Name. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BT_viewController.h"

@interface DisplaySignatureViewController : BT_viewController {

}


@property (nonatomic, strong) NSString *personName;
@property (nonatomic, strong) UILabel *signedBy;
@property (nonatomic, strong) UIImageView *mySignatureView;



@end
