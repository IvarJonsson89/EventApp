//
//  JobTitleVC.h
//  EventApp
//
//  Created by forever on 9/4/17.
//  Copyright © 2017 forever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobTitleVC : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *TextView_Title;


@property (strong,nonatomic)IBOutlet NSString * JobTile;
- (IBAction)Btn_Ok:(id)sender;


@end
