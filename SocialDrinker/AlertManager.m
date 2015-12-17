//
//  AlertManager.m
//  voscreen
//
//  Created by Kagan Ozupek on 15/12/15.
//  Copyright © 2015 Kagan Ozupek. All rights reserved.
//

#import "AlertManager.h"
#import <UIKit/UIKit.h>
@implementation AlertManager

+(void)showAlert: (UIView*)mainView title:(NSString*)title body:(NSString*)body type:(int)type
{

    UIAlertView *message = [[UIAlertView alloc] initWithTitle:title
                                                      message:body
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];

}


@end
