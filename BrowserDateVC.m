//
//  BrowserDateVC.m
//  EventApp
//
//  Created by forever on 9/26/17.
//  Copyright © 2017 forever. All rights reserved.
//

#import "BrowserDateVC.h"
#import "SimpleCell_Date.h"

@interface BrowserDateVC ()
    @property (strong) NSMutableArray * searchedArray;
@end

@implementation BrowserDateVC
{
    /*
    NSMutableDictionary * allEvent;
    NSArray *allArray;
    NSArray *searchResult;
    NSArray *arrayDate;
    NSArray *arrayDateReceive;
    NSArray *arratCategory;
    NSInteger nCount;
    */
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self doSearch:@""];
    /*
    allEvent = [[NSMutableDictionary alloc] init];
    allEvent = [[NSUserDefaults standardUserDefaults] objectForKey:@"DicKey"];
    allArray = [allEvent allValues];
    searchResult = allArray;
    
    nCount = (int)[searchResult count];
    arrayDate =  [searchResult valueForKey:@"event_date"];
    */
}
    
- (void) doSearch:(NSString *)keyword
{
    NSArray *arrAllEvents = [[[NSUserDefaults standardUserDefaults] objectForKey:@"DicKey"] allValues];
    if (!keyword.length)
        self.searchedArray = [NSMutableArray arrayWithArray:arrAllEvents];
    
    else
    {
        NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"(event_date contains[cd] %@)", keyword];
        self.searchedArray = [NSMutableArray arrayWithArray:[arrAllEvents filteredArrayUsingPredicate:resultPredicate]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchedArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 static NSString *simpleTableIdentifier = @"Cell_date";
    
 SimpleCell_Date *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[SimpleCell_Date alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSString *startTime;
    NSString *endTime;
    NSString *country;
    NSString *city;
    NSString *bitween = @"-";
    NSString *space = @" ";


    cell.label_eventname.text = [[self.searchedArray objectAtIndex:indexPath.row] objectForKey:@"event_name"];
    cell.label_date.text = [[self.searchedArray objectAtIndex:indexPath.row] objectForKey:@"event_date"];
    startTime = [[self.searchedArray objectAtIndex:indexPath.row] objectForKey:@"event_start_time"];
    endTime = [[self.searchedArray objectAtIndex:indexPath.row] objectForKey:@"event_end_time"];
    cell.label_time.text = [NSString stringWithFormat:@"%@%@%@",startTime,bitween,endTime];
    country =[[self.searchedArray objectAtIndex:indexPath.row] objectForKey:@"country"];
    city = [[self.searchedArray objectAtIndex:indexPath.row] objectForKey:@"city"];
    cell.label_location.text = [NSString stringWithFormat:@"%@%@%@",country,space,city];
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UISerarchBar Delegate
-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    [self doSearch:searchText];
    [self.table_result reloadData];
}

@end
