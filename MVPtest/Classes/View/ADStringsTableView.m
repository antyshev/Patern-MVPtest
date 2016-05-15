//
//  ADStringsTableView.m
//  MVPtest
//
//  Created by Антышев Дмитрий on 14.05.16.
//  Copyright © 2016 Антышев Дмитрий. All rights reserved.
//

#import "ADStringsTableView.h"
#import "ADStringsTableViewCell.h"

@interface ADStringsTableView()<UITableViewDataSource,UITableViewDelegate>{
    
}

@property(weak,nonatomic)IBOutlet UITableView *tableView;

@end

@implementation ADStringsTableView

#pragma mark - Root

-(void)awakeFromNib{
    [super awakeFromNib];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark - Data
-(void)reloadData{
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dateSource numbersOfItemsInTableView:self];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"CellId";
    ADStringsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = (ADStringsTableViewCell*)[[NSBundle mainBundle]loadNibNamed:@"ADStringsTableViewCell"
                                                                     owner:self options:nil][0];
    }
    cell.title = [self.dateSource tableView:self titleAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate tableView:self didSelectItemAtIndex:indexPath.row];
}
@end
