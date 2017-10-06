//
//  JobDetailVC.m
//  EventApp
//
//  Created by forever on 9/4/17.
//  Copyright © 2017 forever. All rights reserved.
//

#import "JobDetailVC.h"
#import "PostVC.h"

@interface JobDetailVC ()

@end

@implementation JobDetailVC

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


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"show13"]) {
        PostVC *destViewController = segue.destinationViewController;

        
    }
}
- (IBAction)Btn_next:(id)sender {
     [self performSegueWithIdentifier:@"show13" sender:self];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
