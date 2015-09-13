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

@property (nonatomic, strong) UIButton *callButton;
@property (nonatomic, strong) UIButton *sendButton;
@property (nonatomic, strong) UIButton *infoButton;
@property (nonatomic, strong) UIButton *rdButton;
@property (nonatomic, strong) UIButton *topLabel;



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
    
    
//    float width = self.view.bounds.size.width;
//    float height = self.view.bounds.size.height;
    
//    CGRect rect = CGRectMake(0, 0, 500, 400);
    
    
    NSString *category = @"Call for Help";
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Key" bundle:nil];
    self.wordsTableView = [storyboard instantiateViewControllerWithIdentifier:@"wordsTableView"];
    [self addChildViewController:self.wordsTableView];
    [self.view addSubview:self.wordsTableView.view];
    
    self.wordsTableView.textDocumentProxy = self.textDocumentProxy;
    
    //Category Label
    CGRect label = CGRectMake(0, 0, 500, 30);
    self.topLabel = [[UIButton alloc]initWithFrame:label];
    self.topLabel.backgroundColor = [UIColor redColor];
    self.topLabel.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.topLabel.titleLabel.text = category;
    [self.view addSubview:self.topLabel];
    
    //call button
    CGRect rect1 = CGRectMake(110, 180, 40, 30);
    self.callButton = [[UIButton alloc]initWithFrame:rect1];
    self.callButton.backgroundColor = [UIColor redColor];
    self.callButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.callButton.titleLabel.text = @"C";
    [self.view addSubview:self.callButton];
    
    //send button
    CGRect rect2 = CGRectMake(160, 180, 40, 30);
    self.sendButton = [[UIButton alloc]initWithFrame:rect2];
    self.sendButton.backgroundColor = [UIColor orangeColor];
    self.sendButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.sendButton.titleLabel.text = @"S";
    [self.view addSubview:self.sendButton];
    
    //info button
    CGRect rect3 = CGRectMake(210, 180, 40, 30);
    self.infoButton = [[UIButton alloc]initWithFrame:rect3];
    self.infoButton.backgroundColor = [UIColor blueColor];
    self.infoButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.infoButton.titleLabel.text = @"I";
    [self.view addSubview:self.infoButton];
    
    //RD button
    CGRect rect4 = CGRectMake(260, 180, 40, 30);
    self.rdButton = [[UIButton alloc]initWithFrame:rect4];
    self.rdButton.backgroundColor = [UIColor yellowColor];
    self.rdButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.rdButton.titleLabel.text = @"RD";
    [self.view addSubview:self.rdButton];
    
    
    
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
