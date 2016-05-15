//
//  ADItemsViewController.m
//  MVPtest
//
//  Created by Антышев Дмитрий on 14.05.16.
//  Copyright © 2016 Антышев Дмитрий. All rights reserved.
//

#import "ADItemsViewController.h"
#import "ADStringsTableView.h"
#import "ADStorage.h"

@interface ADItemsViewController ()<ADStringsTableViewDataSource,ADStringsTableViewDelegate>{
    ADStringsTableView *tableView;
}

#pragma mark - Observing ADStorage

-(void)dataUpdated:(NSNotification*)notification;

@end

@implementation ADItemsViewController

#pragma mark - LifeCycle

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    tableView = [[NSBundle mainBundle]loadNibNamed:@"ADStringsTableView" owner:self options:nil][0];
    tableView.frame = self.view.frame;
    tableView.dateSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dataUpdated:) name:kADNotificationDataUpdate object:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[ADStorage instance]requestData];
}

#pragma mark - Observing ADStorage
-(void)dataUpdated:(NSNotification *)notification{
    [tableView reloadData];
}

#pragma mark - ADStringsTableViewDataSource

-(NSUInteger)numbersOfItemsInTableView:(ADStringsTableView*)tableView{
    return [[ADStorage instance]itemsCount];
}
-(NSString*)tableView:(ADStringsTableView*)tableView titleAtIndex:(NSUInteger)index{
    return [[ADStorage instance]itemAtIndex:index];
}

#pragma mark - ADStringsTableViewDelegate

-(void)tableView:(ADStringsTableView*)tableView didSelectItemAtIndex:(NSUInteger)index{
    NSString *title = [[ADStorage instance]itemAtIndex:index];
    NSString *msg = [NSString stringWithFormat:@"%@ - title was selected",title];
    
    [[[UIAlertView alloc]initWithTitle:@"Info"
                        message:msg delegate:nil
                        cancelButtonTitle:@"Ok"
                        otherButtonTitles:nil]show];
    
}


-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
