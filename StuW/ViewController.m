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
@property (nonatomic, strong) NSMutableArray *csvFileContents;
@property (strong) IBOutlet NSButton *lowSleepCheckbox;
@property (strong) IBOutlet NSButton *highStressCheckbox;
@property (strong) IBOutlet NSButton *highWorkloadCheckbox;
@property (strong) IBOutlet NSButton *sendEmailsto9thGraders;
@property (strong) IBOutlet NSButton *sendEmailsto10thGraders;
@property (strong) IBOutlet NSButton *sendEmailsto11thGraders;
@property (strong) IBOutlet NSButton *sendEmailsto12thGraders;
@property (strong) IBOutlet NSTextField *additionalEmailAddressesToSendFlagsTo;
@property (strong) IBOutlet NSComboBox *xAxisValueComboBox;
@property (strong) IBOutlet NSComboBox *yAxisValueComboBox;
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

/*
Methods for enacting code when the graphing combo boxes are adjusted.
*/
- (IBAction)setXAxisValue:(id)sender {
    
    
}
- (IBAction)setYAxisValue:(id)sender {


}


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
Methods for executing code when the e-mail preferences are changed.
*/
- (IBAction)sendTo9thGradersCheckbox:(id)sender {
    if([_sendEmailsto9thGraders state]){
        NSLog(@"Send to 9th Graders");
    }
    else
        NSLog(@"Do not send to 9th graders");
}
- (IBAction)sendTo10thGradersCheckbox:(id)sender {
    if([_sendEmailsto10thGraders state]){
        NSLog(@"Send to 10th Graders");
    }
    else
        NSLog(@"Do not send to 10th graders");
}
- (IBAction)sendTo11thGradersCheckbox:(id)sender {
    if([_sendEmailsto11thGraders state]){
        NSLog(@"Send to 11th Graders");
    }
    else
        NSLog(@"Do not send to 11th graders");
}
- (IBAction)sendTo12thGradersCheckbox:(id)sender {
    if([_sendEmailsto12thGraders state]){
        NSLog(@"Send to 12th Graders");
    }
    else
        NSLog(@"Do not send to 12th graders");
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
    
    // This line creates a string object with all of the csv-file's data.
    NSString *csvFileContents = [NSString stringWithContentsOfURL:[[filePanel URLs] firstObject] encoding:NSUTF8StringEncoding error:NULL];
    
    // This line splits the string into an array by new line keys.
    NSArray *csvRowContentsArray = [csvFileContents componentsSeparatedByString:@"\n"];
    // Finds the number of rows that exist within the original csv.
    unsigned long totalRows = [csvRowContentsArray count];
    
    // This line initiallizes the @property MutableArray (With placeholder object "1")
    _csvFileContents = [NSMutableArray arrayWithObjects: @"1", nil];
    
    for(int currentRow = 0; currentRow < totalRows; currentRow++) {
        NSArray *tempArray = [csvRowContentsArray[currentRow] componentsSeparatedByString:@","];
        [_csvFileContents addObject:tempArray];
    }
    // Removes the placeholder object "1" at index 0.
    [_csvFileContents removeObjectAtIndex:0];
    
    
    NSLog(@"%@",_csvFileContents[0][0]);
    
}
 @end



