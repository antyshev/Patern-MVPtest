//
//  ADStringsTableViewCell.m
//  MVPtest
//
//  Created by Антышев Дмитрий on 14.05.16.
//  Copyright © 2016 Антышев Дмитрий. All rights reserved.
//

#import "ADStringsTableViewCell.h"

@interface ADStringsTableViewCell(){
    
}

@property(weak,nonatomic)IBOutlet UILabel *titleLabel;

@end

@implementation ADStringsTableViewCell

#pragma mark - Properties

-(void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = self.title;
}

@end
