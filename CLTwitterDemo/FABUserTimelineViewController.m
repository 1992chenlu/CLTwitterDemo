//
//  FABUserTimelineViewController.m
//  TwitterDemo1
//
//  Created by 鲁辰 on 7/11/15.
//  Copyright (c) 2015 ChenLu. All rights reserved.
//

#import "FABUserTimelineViewController.h"

@implementation FABUserTimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[Twitter sharedInstance] logInGuestWithCompletion:^(TWTRGuestSession *guestSession, NSError *error) {
        if (guestSession) {
            TWTRAPIClient *APIClient = [[Twitter sharedInstance] APIClient];
            TWTRUserTimelineDataSource *userTimelineDataSource = [[TWTRUserTimelineDataSource alloc] initWithScreenName:@"wanquribao" APIClient:APIClient];
            self.dataSource = userTimelineDataSource;
        } else {
            NSLog(@"error: %@", [error localizedDescription]);
        }
    }];
    
}

@end
