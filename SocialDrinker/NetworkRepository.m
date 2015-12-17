//
//  NetworkRepository.m
//  voscreen
//
//  Created by Kagan Ozupek on 08/12/15.
//  Copyright © 2015 Kagan Ozupek. All rights reserved.
//

#import "NetworkRepository.h"
#import "HttpManager.h"
#import "Cache.h"


@implementation NetworkRepository







+(void)getMenu:(UIView*)mainView onFinish:(void (^)(NSObject *response ))onFinish onError:(void (^)(NSObject *response ))onError NS_CLASS_AVAILABLE(NSURLSESSION_AVAILABLE, 7_0)
{
    [HttpManager GET:nil view:mainView url:@"/menu" isFreezeUI:YES showStatusBar:YES completionHandler:^(NSObject *response) {
        
        
        onFinish(response);
        
        
        
        
    } errorHandler:^{
        onError(nil);
    }];
    


}




+(void)getMenuWithId:(NSString*)menuId view:(UIView*)mainView onFinish:(void (^)(NSMutableDictionary *response ))onFinish onError:(void (^)(NSObject *response ))onError NS_CLASS_AVAILABLE(NSURLSESSION_AVAILABLE, 7_0)
{

    [HttpManager GET:nil view:mainView url:[NSString stringWithFormat:@"/menu/%@",menuId] isFreezeUI:YES showStatusBar:YES completionHandler:^(NSObject *response) {
        
        
        onFinish(response);
        
        
        
        
    } errorHandler:^{
        onError(nil);
    }];
    
    


}

+(void)order:(UIView*)mainView  request:(NSMutableDictionary*)request onFinish:(void (^)(NSMutableDictionary *response ))onFinish onError:(void (^)(NSObject *response ))onError NS_CLASS_AVAILABLE(NSURLSESSION_AVAILABLE, 7_0)
{

    [HttpManager POST:request view:mainView url:@"/order" isFreezeUI:YES showAlert:YES showStatusBar:YES completionHandler:^(NSMutableDictionary *response) {
        
        
        
        onFinish(response);
    } errorHandler:^(NSMutableDictionary *err) {
        onError(nil);
    } useToken:NO];


}



@end
