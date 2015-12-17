//
//  OrderController.h
//  SocialDrinker
//
//  Created by Kagan Ozupek on 17/12/15.
//  Copyright © 2015 Kagan Ozupek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tbOrder;
@property(strong,nonatomic) NSMutableArray *datasource;
- (IBAction)CLGonder:(id)sender;

@end
