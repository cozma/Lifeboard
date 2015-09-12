//
//  WordsTableViewController.h
//  lifeboard2
//
//  Created by Dag Yeshiwas on 9/12/15.
//  Copyright (c) 2015 Dag Yeshiwas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordsTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property NSObject<UITextDocumentProxy> *textDocumentProxy;

@end
