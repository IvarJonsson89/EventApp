//
//  BrowserEventVC.h
//  EventApp
//
//  Created by forever on 9/26/17.
//  Copyright © 2017 forever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowserEventVC : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *SeachBar_categoriy;


@end
