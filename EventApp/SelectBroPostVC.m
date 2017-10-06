//
//  SelectBroPostVC.m
//  EventApp
//
//  Created by forever on 8/27/17.
//  Copyright © 2017 forever. All rights reserved.
//

#import "SelectBroPostVC.h"
#import "PostVC.h"
#import "BrowserAttendVC.h"

@interface SelectBroPostVC ()

@end

@implementation SelectBroPostVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)Btn_bro:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BrowserAttendVC *myNewVC = (BrowserAttendVC *)[storyboard instantiateViewControllerWithIdentifier:@"BrowserAttendVC"];
    [self.navigationController pushViewController:myNewVC animated:YES];
}

- (IBAction)Btn_Post:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        PostVC *myNewVC = (PostVC *)[storyboard instantiateViewControllerWithIdentifier:@"PostVC"];
        [self.navigationController pushViewController:myNewVC animated:YES];
}
//- (IBAction)Btn_post:(id)sender {
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    PostVC *myNewVC = (PostVC *)[storyboard instantiateViewControllerWithIdentifier:@"PostVC"];
//    [self.navigationController pushViewController:myNewVC animated:YES];
//}
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"PostVC"]) {
//        PostVC *destViewController = segue.destinationViewController;
////        NSIndexPath *indexpath = nil;
////        
////        indexpath  = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
////        destViewController.recipeName = [searchResult objectAtIndex:indexpath.row];
//        
//    }
//}

@end
