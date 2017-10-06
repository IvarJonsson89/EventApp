//
//  EventsVC.m
//  EventApp
//
//  Created by forever on 8/27/17.
//  Copyright © 2017 forever. All rights reserved.
//

#import "EventsVC.h"
#import "BrowserDateVC.h"

@interface EventsVC ()

@end

@implementation EventsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btn_category:(id)sender {
    

}

- (IBAction)btn_date:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BrowserDateVC *myNewVC = (BrowserDateVC *)[storyboard instantiateViewControllerWithIdentifier:@"BrowerDateVC"];
    [self.navigationController pushViewController:myNewVC animated:YES];
}
@end
