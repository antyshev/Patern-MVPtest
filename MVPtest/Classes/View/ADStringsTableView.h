//
//  ADStringsTableView.h
//  MVPtest
//
//  Created by Антышев Дмитрий on 14.05.16.
//  Copyright © 2016 Антышев Дмитрий. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ADStringsTableView;

@protocol ADStringsTableViewDataSource <NSObject>
@required
-(NSUInteger)numbersOfItemsInTableView:(ADStringsTableView*)tableView;
-(NSString*)tableView:(ADStringsTableView*)tableView titleAtIndex:(NSUInteger)index;

@end

@protocol ADStringsTableViewDelegate <NSObject>
@required
-(void)tableView:(ADStringsTableView*)tableView didSelectItemAtIndex:(NSUInteger)index;

@end


@interface ADStringsTableView : UIView{
    
}

@property(weak,nonatomic)id<ADStringsTableViewDataSource> dateSource;
@property(weak,nonatomic)id<ADStringsTableViewDelegate> delegate;


#pragma mark - Data

-(void)reloadData;

@end
