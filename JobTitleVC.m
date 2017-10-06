//
//  JobTitleVC.m
//  EventApp
//
//  Created by forever on 9/4/17.
//  Copyright © 2017 forever. All rights reserved.
//

#import "JobTitleVC.h"
#import "PostVC.h"

@interface JobTitleVC ()

@end

@implementation JobTitleVC
@synthesize JobTile;
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
    if ([segue.identifier isEqualToString:@"show12"]) {
        PostVC *destViewController = segue.destinationViewController;
//        destViewController.String_Event = self.TextView_Title.text;
                
    }
}
- (IBAction)Btn_Ok:(id)sender {
    [self performSegueWithIdentifier:@"show12" sender:self];
}
@end
