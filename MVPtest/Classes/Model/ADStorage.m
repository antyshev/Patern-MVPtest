//
//  ADStorage.m
//  MVPtest
//
//  Created by Антышев Дмитрий on 14.05.16.
//  Copyright © 2016 Антышев Дмитрий. All rights reserved.
//

#import "ADStorage.h"

//notification
NSString *const kADNotificationDataUpdate = @"kADNotificationDataUpdate";


@interface ADStorage(){
    NSMutableArray *data;
}

@end

@implementation ADStorage


#pragma mark - Root
- (instancetype)init{
    NSAssert(0, @"User 'instance' instead.");
    return nil;
}

-(instancetype)initPrivate{
    return [super init];
}

+(instancetype)instance{
    static ADStorage *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ADStorage alloc]initPrivate];
    });
    return instance;
}


#pragma mark - Data

-(void)requestData{
    data = [[NSMutableArray alloc]initWithObjects:@"testString1",@"testString2",@"testString3", nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:kADNotificationDataUpdate object:self];
}

-(NSString*)itemAtIndex:(NSUInteger)index{
    BOOL accessible = (index < self.itemsCount);
    NSAssert(accessible, @"Index is out of bounds");
    return accessible ? data[index]:nil;
}

-(void)replaceItemAtIndex:(NSUInteger)index value:(NSString*)value{
    BOOL accessible = (index < self.itemsCount);
    NSAssert(accessible, @"Index is out of bounds");
    if (accessible) {
        [data replaceObjectAtIndex:index withObject:value];
        [[NSNotificationCenter defaultCenter]postNotificationName:kADNotificationDataUpdate object:self];
    }
    
}

#pragma mark - Properties

-(NSUInteger)itemsCount{
    return data.count;
}


@end
