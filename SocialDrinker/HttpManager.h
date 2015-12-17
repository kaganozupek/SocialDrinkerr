//
//  HttpManager.h
//  voscreen
//
//  Created by Kagan Ozupek on 08/12/15.
//  Copyright © 2015 Kagan Ozupek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HttpManager : NSObject


+(void)POST:(NSMutableDictionary *)jsonRequestData view:(UIView *) mainView url:(NSString*) urlString  isFreezeUI:(BOOL) isFreezeUI showAlert:(BOOL) showAlert showStatusBar:(BOOL)show completionHandler:(void (^)(NSMutableDictionary *response ))completionHandler errorHandler:(void (^)(NSMutableDictionary *err))errorHandler useToken:(BOOL)useToken NS_CLASS_AVAILABLE(NSURLSESSION_AVAILABLE, 7_0);

+(void)GET:(NSMutableDictionary *)jsonRequestData view:(UIView *) mainView url:(NSString*) urlString  isFreezeUI:(BOOL) isFreezeUI showStatusBar:(BOOL)show completionHandler:(void (^)(NSObject *response ))completionHandler errorHandler:(void (^)())errorHandler NS_CLASS_AVAILABLE(NSURLSESSION_AVAILABLE, 7_0);


+(void)DOWNLOADWITHAFN:(NSMutableDictionary *)jsonRequestData view:(UIView *) mainView url:(NSString*) urlString  isFreezeUI:(BOOL) isFreezeUI showStatusBar:(BOOL)show completionHandler:(void (^)(NSMutableDictionary *response ))completionHandler errorHandler:(void (^)())errorHandler NS_CLASS_AVAILABLE(NSURLSESSION_AVAILABLE, 7_0);

+(void)DOWNLOADWITHSDK:(NSMutableDictionary *)jsonRequestData view:(UIView *) mainView url:(NSString*) urlString  isFreezeUI:(BOOL) isFreezeUI showStatusBar:(BOOL)show completionHandler:(void (^)(NSMutableDictionary *response ))completionHandler errorHandler:(void (^)())errorHandler NS_CLASS_AVAILABLE(NSURLSESSION_AVAILABLE, 7_0);


@end
