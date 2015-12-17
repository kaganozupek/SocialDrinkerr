//
//  Cache.m
//  voscreen
//
//  Created by Kagan Ozupek on 08/12/15.
//  Copyright © 2015 Kagan Ozupek. All rights reserved.
//

#import "Cache.h"




@implementation Cache

NSMutableArray *questionQueue;

//Constants
+(void)setConstants:(NSObject *)constants
{
    [self saveToDefaults:@"cons" val:constants];
    
}
+(NSMutableDictionary*)getConstants
{
    return (NSMutableDictionary*)[self getFromDefaults:@"cons"];
}



+(void)setToken:(NSObject *)constants
{
    [self saveToDefaults:@"sc_token" val:constants];
    
}
+(NSString*)getToken
{
    return (NSString*)[self getFromDefaults:@"sc_token"];
}



+(NSObject*)getFromDefaults:(NSString*) key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSObject * result = [defaults objectForKey:key];
    
    if([result isKindOfClass:[NSData class] ])
    {
        NSData *dictionaryData = [defaults objectForKey:key];
        NSDictionary *dictionary = [NSKeyedUnarchiver unarchiveObjectWithData:dictionaryData];
        return dictionary;
        
    }
    return result;
    
    
}
+(void)saveToDefaults:(NSString *)key val:(NSObject *)value
{
    
    if([value isKindOfClass:[NSDictionary class]])
    {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:value];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    }
    else
    {
        
        
        [[NSUserDefaults standardUserDefaults] setObject:value  forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}

@end
