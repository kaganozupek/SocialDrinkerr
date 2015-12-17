//
//  HttpManager.m
//  voscreen
//
//  Created by Kagan Ozupek on 08/12/15.
//  Copyright © 2015 Kagan Ozupek. All rights reserved.
//

#import "HttpManager.h"
#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "JDStatusBarNotification.h"

#import "Cache.h"
@implementation HttpManager

NSString *urlPreFix = @"http://ancient-scrubland-3152.herokuapp.com";


+(void)POST:(NSMutableDictionary *)jsonRequestData view:(UIView *) mainView url:(NSString*) urlString  isFreezeUI:(BOOL) isFreezeUI showAlert:(BOOL) showAlert showStatusBar:(BOOL)show completionHandler:(void (^)(NSMutableDictionary *response ))completionHandler errorHandler:(void (^)(NSMutableDictionary *err))errorHandler useToken:(BOOL)useToken
{

    NSLog(@"JSON: %@", jsonRequestData);
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
    if(remoteHostStatus == NotReachable) { NSLog(@"not reachable");
        
        
        
        if(show)
        {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [JDStatusBarNotification showWithStatus:@"No Internet connection" dismissAfter:5 styleName:JDStatusBarStyleError];
                
            });
            
        }
        return;
        
    }
    
    
    if(isFreezeUI)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showHUDAddedTo:mainView animated:YES];
            [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
            
        });
        
    }
    
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",urlPreFix,urlString];
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    manager.securityPolicy.allowInvalidCertificates = YES;
    //manager.securityPolicy.validatesCertificateChain = NO;
    
    [manager setRequestSerializer:requestSerializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];

    
    if(useToken)
    {
        NSString *token = [Cache getToken];
        [requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
        
    }
    
    
    
    
    
    [manager POST:url parameters:jsonRequestData success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        if(isFreezeUI)
        {
            [MBProgressHUD hideHUDForView:mainView animated:YES];
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }
        
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        NSLog(@"JSON: %@", responseObject);
       
        
              completionHandler(responseObject);
        

        
      
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
              NSLog(@"JSON: %@", error);
        if(isFreezeUI)
        {
            [MBProgressHUD hideHUDForView:mainView animated:YES];
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }
        [JDStatusBarNotification showWithStatus:@"HTTP ERROR" dismissAfter:5 styleName:JDStatusBarStyleError];

        errorHandler(nil);
        
        
    }];




}

+(void)GET:(NSMutableDictionary *)jsonRequestData view:(UIView *) mainView url:(NSString*) urlString  isFreezeUI:(BOOL) isFreezeUI showStatusBar:(BOOL)show completionHandler:(void (^)(NSObject *response ))completionHandler errorHandler:(void (^)())errorHandler
{

    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
    if(remoteHostStatus == NotReachable) { NSLog(@"not reachable");
        
        if(show)
        {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [JDStatusBarNotification showWithStatus:@"No Internet connection" dismissAfter:5 styleName:JDStatusBarStyleError];
            
        });
        
        }
        return;
        
    }
    
    if(isFreezeUI)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showHUDAddedTo:mainView animated:YES];
            [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
            
        });
    
    }
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSString *url = [NSString stringWithFormat:@"%@%@",urlPreFix,urlString];
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    [manager setRequestSerializer:requestSerializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager GET:url parameters:jsonRequestData success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if(isFreezeUI)
        {
              [MBProgressHUD hideHUDForView:mainView animated:YES];
             [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        NSLog(@"JSON: %@", responseObject);
        completionHandler(responseObject);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(isFreezeUI)
        {
            [MBProgressHUD hideHUDForView:mainView animated:YES];

         [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }
        
        NSLog(@"%@",error);
        [JDStatusBarNotification showWithStatus:@"HTTP ERROR" dismissAfter:5 styleName:JDStatusBarStyleError];

        errorHandler();
        
        
    }];

}

+(void)DOWNLOADWITHAFN:(NSMutableDictionary *)jsonRequestData view:(UIView *) mainView url:(NSString*) urlString  isFreezeUI:(BOOL) isFreezeUI showStatusBar:(BOOL)show completionHandler:(void (^)(NSMutableDictionary *response ))completionHandler errorHandler:(void (^)())errorHandler NS_CLASS_AVAILABLE(NSURLSESSION_AVAILABLE, 7_0)
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
        NSMutableDictionary *feedback = [[NSMutableDictionary alloc]init];
        feedback[@"FileLocation"] = filePath;
        feedback[@"URL"] = urlString;
        completionHandler(feedback);
    }];
    [downloadTask resume];

}
+(void)DOWNLOADWITHSDK:(NSMutableDictionary *)jsonRequestData view:(UIView *) mainView url:(NSString*) urlString  isFreezeUI:(BOOL) isFreezeUI showStatusBar:(BOOL)show completionHandler:(void (^)(NSMutableDictionary *response ))completionHandler errorHandler:(void (^)())errorHandler NS_CLASS_AVAILABLE(NSURLSESSION_AVAILABLE, 7_0)
{
    NSLog(@"downloadVideo %@",urlString);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
                               NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                               
                               if (httpResponse.statusCode == 200){
                                   completionHandler(nil);
                                 
                               }else{
                                   
                                  
                               }
                               
                           }];



}

@end


