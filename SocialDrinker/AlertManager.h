//
//  AlertManager.h
//  voscreen
//
//  Created by Kagan Ozupek on 15/12/15.
//  Copyright © 2015 Kagan Ozupek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertManager : NSObject

+(void)showAlert: (UIView*)mainView title:(NSString*)title body:(NSString*)body type:(int)type;


@end
