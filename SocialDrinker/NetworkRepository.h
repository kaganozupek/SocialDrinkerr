//
//  NetworkRepository.h
//  voscreen
//
//  Created by Kagan Ozupek on 08/12/15.
//  Copyright © 2015 Kagan Ozupek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NetworkRepository : NSObject




+(void)getMenu:(UIView*)mainView onFinish:(void (^)(NSMutableDictionary *response ))onFinish onError:(void (^)(NSObject *response ))onError NS_CLASS_AVAILABLE(NSURLSESSION_AVAILABLE, 7_0);
+(void)getMenuWithId:(NSString*)menuId view:(UIView*)mainView onFinish:(void (^)(NSMutableDictionary *response ))onFinish onError:(void (^)(NSObject *response ))onError NS_CLASS_AVAILABLE(NSURLSESSION_AVAILABLE, 7_0);



+(void)order:(UIView*)mainView request:(NSMutableDictionary*)request onFinish:(void (^)(NSMutableDictionary *response ))onFinish onError:(void (^)(NSObject *response ))onError NS_CLASS_AVAILABLE(NSURLSESSION_AVAILABLE, 7_0);

@end
