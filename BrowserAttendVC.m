//
//  BrowserAttendVC.m
//  EventApp
//
//  Created by forever on 9/24/17.
//  Copyright © 2017 forever. All rights reserved.
//

#import "BrowserAttendVC.h"
#import "PostVC.h"
#import "SimpleCell.h"
#import <Firebase.h>
#import <FirebaseAuth/FirebaseAuth.h>

@interface BrowserAttendVC ()

@end

@implementation BrowserAttendVC
{
    NSMutableArray * Events;
    NSMutableDictionary *AllEvent;
    NSInteger nCell;
    NSArray *array;
    NSArray *array1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      AllEvent = [[NSMutableDictionary alloc] init];
      AllEvent = [[NSUserDefaults standardUserDefaults] objectForKey:@"DicKey"];
      Events = [[NSMutableArray alloc] init];
    Events = [AllEvent mutableCopy];
    NSLog(@"%@", Events);
      array = [AllEvent allKeys];
    array1 = [AllEvent allValues];
      NSLog(@"%lu", (unsigned long)AllEvent.count);
    nCell = (int)[AllEvent count];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return nCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"attendCell";
    
    SimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if (cell == nil) {
    cell = [[SimpleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.SimpleLabel.text = [[array1 objectAtIndex:indexPath.row] objectForKey:@"event_name"];
    
//    FIRDataSnapshot *snapShot = [Events objectAtIndex:indexPath.row];
//    NSString *testText = snapShot.value[@"event_name"];
//          cell.textLabel.text  = [AllEvent objectForKey:@"event_name"];
//        cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
//        cell.imageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];

    return cell;
}


@end
