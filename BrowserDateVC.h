//
//  BrowserDateVC.h
//  EventApp
//
//  Created by forever on 9/26/17.
//  Copyright © 2017 forever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowserDateVC : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *category_sourchbar;
    @property (strong, nonatomic) IBOutlet UITableView *table_result;


@end
