//
//  MyTapGestureRecognizer.h
//  TheWalll
//
//  Created by Kagan Ozupek on 18/02/15.
//  Copyright (c) 2015 Kagan Ozupek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTapGestureRecognizer : UITapGestureRecognizer<UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSIndexPath *data;


@end
