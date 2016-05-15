//
//  ADStorage.h
//  MVPtest
//
//  Created by Антышев Дмитрий on 14.05.16.
//  Copyright © 2016 Антышев Дмитрий. All rights reserved.
//

#import <Foundation/Foundation.h>

//notification
FOUNDATION_EXPORT NSString *const kADNotificationDataUpdate;

@interface ADStorage : NSObject{
    
}

@property(readonly,nonatomic)NSUInteger itemsCount;

#pragma marl - Root

+(instancetype)instance;

#pragma mark - Data

-(void)requestData;

-(NSString*)itemAtIndex:(NSUInteger)index;
-(void)replaceItemAtIndex:(NSUInteger)index value:(NSString*)value;

@end
