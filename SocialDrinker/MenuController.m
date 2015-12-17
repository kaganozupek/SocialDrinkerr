//
//  MenuController.m
//  SocialDrinker
//
//  Created by Kagan Ozupek on 17/12/15.
//  Copyright © 2015 Kagan Ozupek. All rights reserved.
//

#import "MenuController.h"
#import "MyTapGestureRecognizer.h"
#import "OrderController.h"

@interface MenuController ()

@end

@implementation MenuController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIButton* btnOrder = [[UIButton alloc] initWithFrame:CGRectMake(60, 20, 100,35)];
    [btnOrder setTitle:@"Siparişim" forState:UIControlStateNormal];
    [btnOrder setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnOrder setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [btnOrder setBackgroundColor:[UIColor lightGrayColor]];
    [btnOrder setClipsToBounds:YES];
    btnOrder.layer.cornerRadius = 5;
    
    [btnOrder addTarget:self action:@selector(order:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *postButton = [[UIBarButtonItem alloc] initWithCustomView:btnOrder];
    [btnOrder setEnabled:YES];
    [self.navigationController.navigationBar setTintColor:[UIColor darkGrayColor]];
    self.navigationItem.rightBarButtonItem = postButton;

}


-(void)order:(id)sender
{
    
    
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    OrderController * vc = [storyboard instantiateViewControllerWithIdentifier:@"OrderCon"];
    vc.datasource = [_order mutableCopy];
    _order = [[NSMutableArray alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    

    
    


}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Menu";
    _order = [[NSMutableArray alloc]init];
    
   
    
    
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"MenuCell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        // Load the top-level objects from the custom cell XIB.
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
    }
    UIImageView *imgFood = (UIImageView *)[cell viewWithTag:1];
    UILabel *lbTitle = (UILabel *)[cell viewWithTag:2];
    UILabel *lbDescription = (UILabel *)[cell viewWithTag:3];
    UILabel *lbPrice = (UILabel *)[cell viewWithTag:4];
    UILabel *lbButton = (UILabel *)[cell viewWithTag:5];
    
    NSMutableDictionary *item = _datasource[0][@"items"][indexPath.row];
    
    lbTitle.text = item[@"name"];
    lbDescription.text = item[@"type"];
    lbPrice.text = [NSString stringWithFormat:@"%@",item[@"unitPrice"]];
    
    MyTapGestureRecognizer *subsTap = [[MyTapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSubsTap:)];
    
    [subsTap setNumberOfTapsRequired:1];
    
    [lbButton addGestureRecognizer:subsTap];
    subsTap.data = indexPath;
    
    lbButton.userInteractionEnabled = YES;

    
    lbButton.layer.cornerRadius = 5;
    [lbButton setClipsToBounds:YES];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSMutableArray*)_datasource[0][@"items"]).count;
}


-(void)handleSubsTap:(MyTapGestureRecognizer*)sender {
    // push you view here
    //code for full screen image
    
    NSMutableDictionary* d = _datasource[0][@"items"][sender.data.row];
    
    [_order addObject:d];
    
    
    
    
    
    
    
    
}


@end
