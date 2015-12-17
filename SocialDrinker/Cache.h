//
//  Cache.h
//  voscreen
//
//  Created by Kagan Ozupek on 08/12/15.
//  Copyright © 2015 Kagan Ozupek. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Cache : NSObject




+(void)saveToDefaults:(NSString*) key val:(NSObject*) value;
+(NSObject*)getFromDefaults:(NSString*) key;

+(void)setToken:(NSObject*)constants;
+(NSString*)getToken;


@end
