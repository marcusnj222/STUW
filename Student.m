//
//  Student.m
//  StuW
//
//  Created by Tony Love on 7/10/16.
//  Copyright © 2016 Tony Love. All rights reserved.
//

#import "Student.h"

@implementation Student

- (id)initWithUserName:(NSString*)userName
{
    self = [super init];
    if(self)
    {
        self.userName = userName;
    }
    return self;
}

- (NSString *) getUserName
{
    return self.userName;
}


- (void) addTimeStamp:(NSDate*)timeStamp andStressLevel:(NSInteger)stressLevel andSleepAmounts:(NSInteger)sleepAmounts andWorkloadLevel:(NSInteger)workloadLevel
{
    //[self.timeStamp addObject:timeStamp];
    //[self.stressLevel addObject:stressLevel];
    //[self.sleepAmounts addObject:sleepAmounts];
    //[self.workloadLevel addObject:workloadLevel];
}

/*
 A method for adding in new values into the arrays which hold the data for each student.
 @property (readwrite) NSMutableArray *timeStamp;
 @property (readwrite) NSMutableArray *stressLevel;
 @property (readwrite) NSMutableArray *sleepAmounts;
 @property (readwrite) NSMutableArray *workloadLevel;
*/

+ (instancetype) studentWithUserName:(NSString*)userName
{
    Student *student = [[Student alloc] initWithUserName:userName];
    return student;
}

@end
