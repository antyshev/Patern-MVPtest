//
//  AppDelegate.m
//  MVPtest
//
//  Created by Антышев Дмитрий on 14.05.16.
//  Copyright © 2016 Антышев Дмитрий. All rights reserved.
//

#import "AppDelegate.h"
#import "ADItemsViewController.h"
@interface AppDelegate (){
    
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [ADItemsViewController new];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
