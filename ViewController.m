//
//  ViewController.m
//  StuW
//
//  Created by Tony Love on 7/8/16.
//  Copyright © 2016 Tony Love. All rights reserved.
//

/*
 An array of dictionaries or Student Objects.
 Set up a table view controller 
 */

#import "ViewController.h"
#import "Student.h"
#import "GraphView.h"


@interface ViewController()

@property (nonatomic, strong) NSString *selectedFileName;
@property (nonatomic, strong) NSString *uniqueStudentRecords;
@property (nonatomic, strong) NSString *csvStringFileContents;
@property (nonatomic, strong) NSString *numberOfRecordsFound;
@property (nonatomic, strong) NSMutableArray *csvArrayFileContents;
@property (nonatomic, strong) NSMutableDictionary *studentDataDictOfDict;
@property (strong) IBOutlet NSButton *lowSleepCheckbox;
@property (strong) IBOutlet NSButton *highStressCheckbox;
@property (strong) IBOutlet NSButton *highWorkloadCheckbox;
@property (strong) IBOutlet NSTextField *additionalEmailAddressesToSendFlagsTo;
@property (strong) IBOutlet GraphView *graphView;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}



// Email composition code
- (IBAction)sendEmail:(id)sender {
    NSString* textAttributedString = @"Hello world!"; // generate the message body here.
    
    NSSharingService* mailShare = [NSSharingService sharingServiceNamed:NSSharingServiceNameComposeEmail];
    NSArray* shareItems = @[textAttributedString];
    [mailShare setRecipients:@[@"tony.love@concordiashanghai.org"]];
    [mailShare setSubject:@"test e-mail"];
    [mailShare performWithItems:shareItems];
    
    
    NSLog(@"sent",nil);
}

- (IBAction)generateTestPDF:(id)sender {
    
}



/*
 Methods for executing code when flag settings are changed.
 All flags are on as default.  
 Students can be flagged for reporting fewer than X hrs of sleep on average.
 Students can be flagged for reporting more than Y stress on average.
 Students can be flagged for reporting more than Z workload on average.
*/
- (IBAction)lowSleepFlag:(id)sender {
    if([_lowSleepCheckbox state]){
        NSLog(@"Sleep Box True");
        [self.graphView drawLine];
    } else {
        NSLog(@"Sleep Box False");
    }
    
}
- (IBAction)highStressFlag:(id)sender {
    if([_highStressCheckbox state]){
        NSLog(@"Stress box true");
    } else {
        NSLog(@"Stress box false");
    }
}


- (IBAction)highWorkloadFlag:(id)sender {
    if([_highWorkloadCheckbox state]){
        NSLog(@"Workload box true");
    } else {
        NSLog(@"Workload box false");
    }
}


- (IBAction)selectFilePressed:(id)sender
{
    NSOpenPanel *filePanel = [NSOpenPanel openPanel];
    
    [filePanel setCanChooseDirectories:NO];
    [filePanel setAllowedFileTypes:[NSArray arrayWithObject:@"csv"]];
    [filePanel setCanChooseFiles:YES];
    
    if ([filePanel runModal] == NSModalResponseOK)
    {
        NSURL *fileURL = [[filePanel URLs] firstObject];
        [self setSelectedFileName:[(NSString*)[[fileURL pathComponents] lastObject] stringByDeletingPathExtension]];
    }
    
    // This line creates a link between the string object and the url of the csv-file's data (?).
    self.csvStringFileContents = [NSString stringWithContentsOfURL:[[filePanel URLs] firstObject] encoding:NSASCIIStringEncoding error:NULL];
    
    NSArray *csvRowContentsArray = [self.csvStringFileContents componentsSeparatedByString:@"\r"];
    
    // Finds the number of rows that exist within the original csv.
    unsigned long totalRows = [csvRowContentsArray count];
    
    // This line initiallizes the @property MutableArray (With placeholder object "1")
    self.csvArrayFileContents = [NSMutableArray array];
    
    for(int currentRow = 0; currentRow < totalRows; currentRow++) {
        NSArray *tempArray = [csvRowContentsArray[currentRow] componentsSeparatedByString:@","];
        [self.csvArrayFileContents addObject:tempArray];
     }
    
    /*
     self.csvArrayFileContents now contains the information in the original .csv file
     uploaded by the user.  The structure of this 2D array allows you to access data by
     row and column following this structure:
        self.csvArrayFileContents[row][column]
     */
    
    
    // This for loop creates the list of unique usernames from the submissions.
    // Time is less than 1 second for 16-17 school year (3700+ lines to search through).
    NSMutableArray *userNameKeys = [[NSMutableArray alloc] init];
    [userNameKeys addObject:(NSString*) self.csvArrayFileContents[1][1]];
    
    for (int userNameNumber = 1; userNameNumber < totalRows; userNameNumber++)
    {
        NSUInteger currentNumberOfKeys = [userNameKeys count];
        for (int keyNumber = 0; keyNumber < currentNumberOfKeys; keyNumber++) {
            if ([self.csvArrayFileContents[userNameNumber][1] isEqualToString:userNameKeys[keyNumber]]) {
                // NSLog(@"Duplicate key found in key list.",nil);
                // NSLog(@"Username # %d is the same as key # %d",userNameNumber,keyNumber);
                keyNumber = (int) currentNumberOfKeys;
            } else if (keyNumber == currentNumberOfKeys - 1){
                [userNameKeys addObject:self.csvArrayFileContents[userNameNumber][1]];
            }
            
        }
    }
    
    // Displays the number of records found and from how many unique students.
    NSString *studentRecordsFound = [NSString stringWithFormat:@"%@ records found from %@ students.",[NSString stringWithFormat:@"%li", totalRows],[NSString stringWithFormat:@"%li", [userNameKeys count]]];
    [self setNumberOfRecordsFound:studentRecordsFound];
    
    
    
    
    
    self.studentDataDictOfDict = [NSMutableDictionary dictionary];
    // This loop initializes objects for each student which will hold the data contained.
    // Data is contained in arrays.  Points for graph are derived from the data, but kept in separate arrays.
    for (int i=0; i<[userNameKeys count]; i++) {
        NSString *userName = userNameKeys[i];
        NSMutableArray *timeStampArray = [NSMutableArray array]; // Try this, but may need to change it back to [[NSMutableArray alloc] init]
        NSMutableArray *happinessContentmentArray = [NSMutableArray array];
        NSMutableArray *happinessPoints = [NSMutableArray array];
        NSMutableArray *stressLevelArray = [NSMutableArray array];
        NSMutableArray *stressLevelPoints = [NSMutableArray array];
        NSMutableArray *stressTypeArray = [NSMutableArray array];
        NSMutableArray *stressTypePoints = [NSMutableArray array];
        NSMutableArray *sleepTimesArray = [NSMutableArray array];
        NSMutableArray *sleepPoints = [NSMutableArray array];
        NSMutableArray *workloadsArray = [NSMutableArray array];
        NSMutableArray *workloadPoints = [NSMutableArray array];
        NSMutableArray *counselorRequestsArray = [NSMutableArray array];
        Boolean emailSentState = 0;
        
        NSArray *studentDataObjectsArray = @[userName,
                                            timeStampArray,
                                            happinessContentmentArray,
                                            happinessPoints,
                                            stressLevelArray,
                                            stressLevelPoints,
                                            stressTypeArray,
                                            stressTypePoints,
                                            sleepTimesArray,
                                            sleepPoints,
                                            workloadsArray,
                                            workloadPoints,
                                            counselorRequestsArray,
                                            [NSNumber numberWithBool:emailSentState]];
        
        
        NSArray *studentDataKeyArray = @[@"User Name", @"Time Stamps", @"Happiness and Contentment", @"Happiness Points", @"Stress Levels", @"Stress Level Points", @"Stress Type", @"Stress Type Points", @"Sleep Times", @"Sleep Points", @"Workloads", @"Workload Points", @"Counselor Requests", @"Email State"];

        // Creates a dictionary of student response data.
        NSDictionary *studentData = [NSDictionary dictionaryWithObjects:studentDataObjectsArray forKeys:studentDataKeyArray];
        
        int xValue = 0;
        
        for (int userNameNumber = 1; userNameNumber < totalRows; userNameNumber++) {
            // Loads the student responses into the student's arrays of data.
            if ([userNameKeys[i] isEqualToString:self.csvArrayFileContents[userNameNumber][1]]) {
                [timeStampArray addObject:self.csvArrayFileContents[userNameNumber][0]];
                
                // This calculates the x coordinate from the timestamp NSString.
                // NSString --> NSArray --> NSNumber --> intValue.
                // tempTimeStampArray[0] holds the month string value.
                // tempTimeStampArray[1] holds the day string value.
                // tempTimeStampArray[2] holds the year value.
                NSArray *tempTimeStampArray =[self.csvArrayFileContents[userNameNumber][0] componentsSeparatedByString:@"/"];
                if ([tempTimeStampArray[0] intValue]==8) {xValue =[tempTimeStampArray[1] intValue];}
                if ([tempTimeStampArray[0] intValue]==9) {xValue =[tempTimeStampArray[1] intValue] + 31;}
                if ([tempTimeStampArray[0] intValue]==10) {xValue =[tempTimeStampArray[1] intValue] + 61;}
                if ([tempTimeStampArray[0] intValue]==11) {xValue =[tempTimeStampArray[1] intValue] + 92;}
                if ([tempTimeStampArray[0] intValue]==12) {xValue =[tempTimeStampArray[1] intValue] + 122;}
                if ([tempTimeStampArray[0] intValue]==1) {xValue =[tempTimeStampArray[1] intValue] + 153;}
                if ([tempTimeStampArray[0] intValue]==2) {xValue =[tempTimeStampArray[1] intValue] + 184;}
                if ([tempTimeStampArray[0] intValue]==3) {xValue =[tempTimeStampArray[1] intValue] + 213;}
                if ([tempTimeStampArray[0] intValue]==4) {xValue =[tempTimeStampArray[1] intValue] + 244;}
                if ([tempTimeStampArray[0] intValue]==5) {xValue =[tempTimeStampArray[1] intValue] + 274;}
                if ([tempTimeStampArray[0] intValue]==6) {xValue =[tempTimeStampArray[1] intValue] + 304;}
                
                // Places happiness data into the array and places and (x,y) data point into a point array.
                [happinessContentmentArray addObject:self.csvArrayFileContents[userNameNumber][2]];
                
                CGPoint tempHappinessPoint;
                tempHappinessPoint.x = xValue;
                tempHappinessPoint.y = [self.csvArrayFileContents[userNameNumber][2] intValue];
                NSLog(@"Happiness Point x: %f", tempHappinessPoint.x);
                NSLog(@"Happiness Point y: %f", tempHappinessPoint.y);
                [happinessPoints addObject:[NSValue valueWithPoint:tempHappinessPoint]];
                
                // Places stress level data into the array and places and (x,y) data point into a point array.
                [stressLevelArray addObject:self.csvArrayFileContents[userNameNumber][3]];
                CGPoint tempStressLevelPoint;
                tempStressLevelPoint.x = xValue;
                tempStressLevelPoint.y = [self.csvArrayFileContents[userNameNumber][3] intValue];
                [stressLevelPoints addObject:[NSValue valueWithPoint:tempStressLevelPoint]];
                // Places stress type data into the array and places and (x,y) data point into a point array.
                [stressTypeArray addObject:self.csvArrayFileContents[userNameNumber][4]];
                CGPoint tempStressTypePoint;
                tempStressTypePoint.x = xValue;
                tempStressTypePoint.y = [self.csvArrayFileContents[userNameNumber][4] intValue];
                [stressTypePoints addObject:[NSValue valueWithPoint:tempStressTypePoint]];
                // Places sleep data into the array and places and (x,y) data point into a point array.
                [sleepTimesArray addObject:self.csvArrayFileContents[userNameNumber][5]];
                CGPoint tempSleepTimePoint;
                tempSleepTimePoint.x = xValue;
                tempSleepTimePoint.y = [self.csvArrayFileContents[userNameNumber][5] intValue];
                [sleepPoints addObject:[NSValue valueWithPoint:tempSleepTimePoint]];
                // Places workload data into the array and places and (x,y) data point into a point array.
                [workloadsArray addObject:self.csvArrayFileContents[userNameNumber][6]];
                CGPoint tempWorkloadPoint;
                tempWorkloadPoint.x = xValue;
                tempWorkloadPoint.y = [self.csvArrayFileContents[userNameNumber][6] intValue];
                [workloadPoints addObject:[NSValue valueWithPoint:tempWorkloadPoint]];
                
                [counselorRequestsArray addObject:self.csvArrayFileContents[userNameNumber][7]];
            }
        }
        // Loads the last student's data set into a master dictionary of all student data sets.
        self.studentDataDictOfDict[userNameKeys[i]] = studentData;
    }
   
    NSLog(@"Happiness Points: %@", [[self.studentDataDictOfDict objectForKey:userNameKeys[0]] objectForKey:@"Happiness Points"]);
    NSLog(@"Stress Level Points: %@", [[self.studentDataDictOfDict objectForKey:userNameKeys[0]] objectForKey:@"Stress Level Points"]);
    NSLog(@"Stress Type Points: %@", [[self.studentDataDictOfDict objectForKey:userNameKeys[0]] objectForKey:@"Stress Type Points"]);
    NSArray *tempHappinessPoints =[[NSArray alloc ]initWithArray:[[self.studentDataDictOfDict objectForKey:userNameKeys[0]] objectForKey:@"Happiness Points"]];
    
    [self.graphView drawHappinessGraph:tempHappinessPoints];
}
 @end



