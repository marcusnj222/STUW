//
//  Student.h
//  StuW
//
//  Created by Tony Love on 7/10/16.
//  Copyright © 2016 Tony Love. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (assign) NSString *userName;
@property (readwrite) NSMutableArray *timeStamp;
@property (readwrite) NSMutableArray *stressLevel;
@property (readwrite) NSMutableArray *sleepAmounts;
@property (readwrite) NSMutableArray *workloadLevel;


- (id)initWithUserName:(NSString*)userName;

- (NSString *) getUserName;

- (void) addTimeStamp:(NSInteger)timeStamp andStressLevel:(NSInteger)stressLevel andSleepAmounts:(NSInteger)sleepAmounts andWorkloadLevel:(NSInteger)workloadLevel;
+ (instancetype) studentWithUserName:(NSString*)userName;

@end

/*
Use a dictionary key:username object:NSObject

 NSMutableDictionary for each student, the key is the username and the value is the information of each student.  
 The objects inside each dictionary are arrays of each value that should be stored.
 
 */