//
//  PositionVC.m
//  EventApp
//
//  Created by forever on 8/27/17.
//  Copyright © 2017 forever. All rights reserved.
//

#import "PositionVC.h"
#import "EMCCountryPickerController.h"
#import "SelectBroPostVC.h"


@interface PositionVC ()

@end

@implementation PositionVC
{
    NSArray * Array_counry;
    NSArray * Array_cities;
    NSDictionary *dict;

}


@synthesize Label_city;
@synthesize Label_country;
@synthesize searchResult;
@synthesize searchResult_City;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    dict = [self JSONFromFile];
    Array_counry = [dict allKeys];
    self.View_search.hidden = YES;
    self.View_search2.hidden = YES;
    searchResult = Array_counry;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Initialize Datas

-(NSDictionary *)JSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"countriesToCities" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

# pragma mark - IBActions

- (IBAction)Btn_country:(id)sender {
    self.View_search.layer.borderWidth = 1.5;
    self.View_search.layer.borderColor = [[UIColor colorWithRed:218.0f/255.0f green:1.0 blue:1.0 alpha:1.0] CGColor];
    if (self.View_search.hidden == YES) {
        self.View_search.hidden = NO;
        self.SearchBar.text = @"";
        self.searchResult = Array_counry;
        [self.TableView_counties reloadData];
        
    }
    else {
        self.View_search.hidden = YES;
        self.searchResult = Array_cities;
        [self.TableView_cities reloadData];
        
    }
}

- (IBAction)Btn_city:(id)sender {
    self.View_search2.layer.borderWidth = 1.5;
    self.View_search2.layer.borderColor = [[UIColor colorWithRed:218.0f/255.0f green:1.0 blue:1.0 alpha:1.0] CGColor];
    [self.TableView_cities reloadData];
    if (self.View_search2.hidden == YES) {
        self.View_search2.hidden = NO;
        self.searchCityBar.text = @"";
    }
    else
        self.View_search2.hidden = YES;

}

#pragma mark - UITableViewDelegate and Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 18;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [searchResult count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    if (tableView == self.TableView_counties) {
        cell.textLabel.text = [searchResult objectAtIndex:indexPath.row];

    } else if (tableView == self.TableView_cities) {
        cell.textLabel.text = [searchResult objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *country;
    
    if (tableView == self.TableView_counties) {
        self.View_search.hidden = YES;
        self.Label_country.text = [searchResult objectAtIndex:indexPath.row];
        self.stringCountry = [searchResult objectAtIndex:indexPath.row];
        [[NSUserDefaults standardUserDefaults] setObject:self.stringCountry forKey:@"StringCountry"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        country = self.Label_country.text;
        Array_cities= [dict objectForKey:country];
        searchResult = Array_cities;
        [self.TableView_cities reloadData];
        Label_city.text = @"City";
        
        
        self.View_search.hidden = YES;
        
    } else {
        self.View_search2.hidden = YES;
        self.Label_city.text = [searchResult objectAtIndex:indexPath.row];
        self.stringCity = [searchResult objectAtIndex:indexPath.row];
        [[NSUserDefaults standardUserDefaults] setObject:self.stringCity forKey:@"StringCity"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}


#pragma mark - UISearchBarDelegate

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSPredicate * resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@",searchText];
    if (searchBar == self.SearchBar) {
        if (searchText.length == 0) {
            searchResult = Array_counry;
        } else {
            searchResult = [Array_counry filteredArrayUsingPredicate:resultPredicate];
        }
        [self.TableView_counties reloadData];
    }
    
    if (searchBar == self.searchCityBar) {
        if (searchText.length == 0) {
            searchResult = Array_cities;
        } else {
            searchResult = [Array_cities filteredArrayUsingPredicate:resultPredicate];
        }
        [self.TableView_cities reloadData];
    }
}



- (IBAction)Btn_next:(id)sender {
    if ([Label_country.text  isEqual: @"Country"] || [Label_city.text  isEqual: @"City"]) {
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Dear"
                                     message:@"Please fill blank"
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Yes, I see"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        nil;
                                    }];
        
        
        [alert addAction:yesButton];
       
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    else
    {
UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SelectBroPostVC *myNewVC = (SelectBroPostVC *)[storyboard instantiateViewControllerWithIdentifier:@"SelectBroPost"];
    [self.navigationController pushViewController:myNewVC animated:YES];

    }
    
}
@end
    

