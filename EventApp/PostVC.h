//
//  PostVC.h
//  EventApp
//
//  Created by forever on 8/27/17.
//  Copyright © 2017 forever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostVC : UIViewController<UITextFieldDelegate,UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *Edit_category;
@property (strong, nonatomic) IBOutlet UITextField *Edit_Event;
@property (strong, nonatomic) IBOutlet UITextField *Edit_Date;

@property (strong, nonatomic) IBOutlet UITextField *Edit_Time;
@property (strong, nonatomic) IBOutlet UITextField *Edit_EndTime;
@property (strong, nonatomic) IBOutlet UITextField *Edit_Details;
@property (strong, nonatomic) IBOutlet UITextView *Text_Details;
@property (strong, nonatomic) IBOutlet NSString *string_Country;
@property (strong, nonatomic) IBOutlet NSString *string_City;
@property (strong, nonatomic) IBOutlet NSMutableArray *allEvent;
@property (strong, nonatomic) IBOutlet NSMutableDictionary *paramDic;
- (IBAction)Btn_Post:(id)sender;

@end
