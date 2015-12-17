//
//  OrderController.m
//  SocialDrinker
//
//  Created by Kagan Ozupek on 17/12/15.
//  Copyright © 2015 Kagan Ozupek. All rights reserved.
//

#import "OrderController.h"
#import "NetworkRepository.h"
#import "AlertManager.h"
@interface OrderController ()

@end

@implementation OrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Sipraişim";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Deneme"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Deneme"] ;
        
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    }
    
    
    cell.textLabel.text = _datasource[indexPath.row][@"name"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datasource.count;
}


// Override to support conditional editing of the table view.
// This only needs to be implemented if you are going to be returning NO
// for some items. By default, all items are editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        [_datasource removeObjectAtIndex:indexPath.row];
        [_tbOrder deleteRowsAtIndexPaths:[[NSArray alloc] initWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationLeft];
        
        
    }
}

- (IBAction)CLGonder:(id)sender {
    
    
    if(_datasource.count > 0)
    {
        NSMutableDictionary * request = [[NSMutableDictionary alloc]init];
        request[@"items"] = _datasource;
        [NetworkRepository order:self.view request:request onFinish:^(NSMutableDictionary *response) {
            
            int  x = 0;
            [AlertManager showAlert:self.view title:@"Teşekkürler." body:@"Siparişiniz Alınmıştır." type:0];
            [self.navigationController popViewControllerAnimated:YES];
            
        } onError:^(NSObject *response) {
            
        }];
        

    
    }else
    {
        [AlertManager showAlert:self.view title:@"" body:@"Lütfen sipariş ekleyiniz." type:0];
    
    }
    
    
    
    
    
    
}
@end
