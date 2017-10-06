//
//  PositionVC.h
//  EventApp
//
//  Created by forever on 8/27/17.
//  Copyright © 2017 forever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EMCCountryDelegate.h>
#import "TPKeyboardAvoidingScrollView.h"
@interface PositionVC : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (strong, nonatomic) IBOutlet UITableView *TableView_counties;
@property (strong, nonatomic) IBOutlet UITableView *TableView_cities;

@property (nonatomic, strong) NSArray *searchResult;
@property (nonatomic, readonly) NSArray *searchResult_City;

- (IBAction)Btn_country:(id)sender;
- (IBAction)Btn_city:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *Label_country;
@property (strong, nonatomic) IBOutlet UILabel *Label_city;
@property (strong, nonatomic) IBOutlet UIView *View_search;
@property (strong, nonatomic) IBOutlet NSString *stringCountry;
@property (strong, nonatomic) IBOutlet NSString *stringCity;

@property (strong, nonatomic) IBOutlet UISearchBar *SearchBar;
@property (strong, nonatomic) IBOutlet UIView *View_search2;
@property (strong, nonatomic) IBOutlet UISearchBar *searchCityBar;
- (IBAction)Btn_next:(id)sender;

@end
