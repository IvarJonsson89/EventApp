//
//  PostVC.m
//  EventApp
//
//  Created by forever on 8/27/17.
//  Copyright © 2017 forever. All rights reserved.
//

#import "PostVC.h"
#import "EventsVC.h"
#import <Firebase.h>
#import <FirebaseAuth/FirebaseAuth.h>

@interface PostVC ()
{
    NSMutableDictionary *allEvents;
    NSMutableDictionary * paramDic;
}

@property FIRDatabaseReference *ref;

@end

@implementation PostVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.string_Country = [[NSUserDefaults standardUserDefaults] stringForKey:@"StringCountry"];
    self.string_City = [[NSUserDefaults standardUserDefaults] stringForKey:@"StringCity"];
    }


-(void)viewWillAppear:(BOOL)animated
{
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField.tag == 1 ) {
        self.Edit_Event.text = @"";
        
    }
    else if (textField.tag == 2) {
        self.Edit_Date.text = @"";
        UIDatePicker * mypicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
        [mypicker setDate:[NSDate date]];
        [mypicker addTarget:self action:@selector(updateTextField_Date:) forControlEvents:UIControlEventValueChanged];
        mypicker.datePickerMode = UIDatePickerModeDate;
        [self.Edit_Date setInputView:mypicker];
        
    }
    
    else if (textField.tag == 3){
        self.Edit_Time.text = @"";
        UIDatePicker * mypicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
        [mypicker setDate:[NSDate date]];
        [mypicker addTarget:self action:@selector(updateTextField_StartTime:) forControlEvents:UIControlEventValueChanged];
        NSDateFormatter * formate = [[NSDateFormatter alloc]init];
        [formate setDateStyle:NSDateFormatterNoStyle];
        [formate setTimeStyle:NSDateFormatterLongStyle];
        mypicker.datePickerMode = UIDatePickerModeTime;
        [self.Edit_Time setInputView:mypicker];
    }
    else if (textField.tag == 4){
        self.Edit_EndTime.text = @"";
        UIDatePicker * mypicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
        [mypicker setDate:[NSDate date]];
        [mypicker addTarget:self action:@selector(updateTextField_EndTime:) forControlEvents:UIControlEventValueChanged];
        mypicker.datePickerMode = UIDatePickerModeTime;
        [self.Edit_EndTime setInputView:mypicker];
    }
    else if (textField.tag == 0) {
        self.Edit_category.text = @"";
        
    }
    
}


-(void)updateTextField_Date:(id)sender
{
    UIDatePicker *picker = (UIDatePicker *)self.Edit_Date.inputView;
    NSDateFormatter * formate = [[NSDateFormatter alloc]init];
    [formate setDateFormat:@"dd/MM/YYYY"];
    self.Edit_Date.text = [formate stringFromDate:picker.date];

}

-(void)updateTextField_StartTime:(id)sender
{
    UIDatePicker *picker = (UIDatePicker *)self.Edit_Time.inputView;
    NSDateFormatter * formate = [[NSDateFormatter alloc]init];
    [formate setDateFormat:@"hh:mm a"];
    self.Edit_Time.text = [formate stringFromDate:picker.date];
    
}

-(void)updateTextField_EndTime:(id)sender
{
    UIDatePicker *picker = (UIDatePicker *)self.Edit_EndTime.inputView;
    NSDateFormatter * formate = [[NSDateFormatter alloc]init];
    [formate setDateFormat:@"hh:mm a"];
    self.Edit_EndTime.text = [formate stringFromDate:picker.date];
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.Text_Details.text = @"";
    [textView setFont:[UIFont fontWithName:@"ArialMT" size:16]];
}



//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
//    return YES;
//}


- (IBAction)Btn_Post:(id)sender {
    paramDic = [[NSMutableDictionary alloc] init];
    NSString *eventID = [[NSUUID UUID] UUIDString];
    [paramDic setObject:eventID forKey:@"event_id"];
    [paramDic setObject:self.Edit_category.text forKey:@"event_category"];
    [paramDic setObject:self.Edit_Event.text forKey:@"event_name"];
    [paramDic setObject:self.Edit_Date.text forKey:@"event_date"];
    [paramDic setObject:self.Edit_Time.text forKey:@"event_start_time"];
    [paramDic setObject:self.Edit_EndTime.text forKey:@"event_end_time"];
    [paramDic setObject:self.Text_Details.text forKey:@"event_detail"];
    [paramDic setObject:self.string_Country forKey:@"country"];
    [paramDic setObject:self.string_City forKey:@"city"];
    
    
    [self requestAPI:paramDic];

}

#pragma mark - API - Log In
- (void)requestAPI:(NSMutableDictionary *)dic {
    [self performSelector:@selector(requestData:) withObject:dic afterDelay:1.0f];
}

- (void)requestData:(id) params {
    [[FIRAuth auth] signInWithEmail:@"kevin@mail.com" password:@"123456" completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
        
        if (error) {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning"                                       message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"OK"               style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [alert dismissViewControllerAnimated:YES completion:nil];
            }]];
            
            [self presentViewController:alert animated:YES completion:nil];
            
            NSLog(@"Error in FIRAuth := %@",error.localizedDescription);
            
        }
        
        else{
            self.ref = [[FIRDatabase database] reference];
            NSDictionary *insertEventData = @{[NSString stringWithFormat:@"/events/%@", [params objectForKey:@"event_id"]]: params};
            [_ref updateChildValues:insertEventData withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nullable ref){
                
                if(error){
                    
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning"                                       message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                    
                    [alert addAction:[UIAlertAction actionWithTitle:@"OK"               style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                        [alert dismissViewControllerAnimated:YES completion:nil];
                    }]];
                    
                    [self presentViewController:alert animated:YES completion:nil];
                    
                    NSLog(@"Error in FIRInsertChild := %@",error.localizedDescription);
                    
                }else{
                    [[_ref child:@"events"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot){
                        allEvents = [[NSMutableDictionary alloc] init];
                        allEvents = snapshot.value;
                        
                        [[NSUserDefaults standardUserDefaults] setObject:allEvents forKey:@"DicKey"];
                        
                        NSMutableArray *allEventsArray = [[NSMutableArray alloc] init];
                        NSMutableArray *allEventsArray1 = [[NSMutableArray alloc] init];
                        allEventsArray = [[allEvents allValues] mutableCopy];
                        allEventsArray1= [[allEvents allKeys] mutableCopy];
                        NSUInteger arryLength = [allEventsArray count];
                        NSLog(@"%lu", (unsigned long)arryLength);

                                                
                        [self navToBrowseView];
                        
                    }withCancelBlock:^(NSError * _Nonnull error){
                        
                        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning"                                       message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                        
                        [alert addAction:[UIAlertAction actionWithTitle:@"OK"               style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                            [alert dismissViewControllerAnimated:YES completion:nil];
                        }]];
                        
                        [self presentViewController:alert animated:YES completion:nil];
                    }];
                    
                }
                
            }];
        }}];
    
}

-(void) navToBrowseView{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        EventsVC *myNewVC = (EventsVC *)[storyboard instantiateViewControllerWithIdentifier:@"EventsVC"];
        [self.navigationController pushViewController:myNewVC animated:YES];
}

@end
