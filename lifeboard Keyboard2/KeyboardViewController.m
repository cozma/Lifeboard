//
//  KeyboardViewController.m
//  lifeboard Keyboard2
//
//  Created by Dag Yeshiwas on 9/12/15.
//  Copyright (c) 2015 Dag Yeshiwas. All rights reserved.
//

#import "KeyboardViewController.h"
#import "WordsTableViewController.h"

@interface KeyboardViewController ()
@property (nonatomic, strong) UIButton *nextKeyboardButton;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) WordsTableViewController *wordsTableView;

@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //set up tableview
//    float width = self.view.bounds.size.width;
//    float height = self.view.bounds.size.height;
//    CGRect rect = CGRectMake(0, 0, 500, 400);
//    
//    self.tableView = [[UITableView alloc] initWithFrame:rect];
//    [self.view addSubview:self.tableView];
    
    
    float width = self.view.bounds.size.width;
    float height = self.view.bounds.size.height;
    CGRect rect = CGRectMake(0, 0, 500, 400);
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Key" bundle:nil];
    self.wordsTableView = [storyboard instantiateViewControllerWithIdentifier:@"wordsTableView"];
    [self addChildViewController:self.wordsTableView];
    [self.view addSubview:self.wordsTableView.view];
    
    
    
    // Perform custom UI setup here
    self.nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.nextKeyboardButton setTitle:NSLocalizedString(@"Next Keyboard", @"Title for 'Next Keyboard' button") forState:UIControlStateNormal];
    [self.nextKeyboardButton sizeToFit];
    self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.nextKeyboardButton addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.nextKeyboardButton];
    
    NSLayoutConstraint *nextKeyboardButtonLeftSideConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *nextKeyboardButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self.view addConstraints:@[nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    [self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}

@end
