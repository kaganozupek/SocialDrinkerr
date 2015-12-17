//
//  MenuController.h
//  SocialDrinker
//
//  Created by Kagan Ozupek on 17/12/15.
//  Copyright © 2015 Kagan Ozupek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tblMenu;
@property (strong, nonatomic)  NSMutableArray* datasource;
@property (strong, nonatomic)  NSMutableArray* order;
@end
