//
//  LoopViewController.m
//  InstaMelody
//
//  Created by Ahmed Bakir on 8/17/15.
//  Copyright (c) 2015 InstaMelody. All rights reserved.
//

#import "LoopViewController.h"
#import "DataManager.h"
#import "MelodyGroup.h"
#import "NSString+FontAwesome.h"
#import "UIFont+FontAwesome.h"
#import "AFURLSessionManager.h"
#import "constants.h"

@interface LoopViewController ()

@property (nonatomic, strong) NSArray *groupArray;
@property (nonatomic, strong) Melody *selectedMelody;

@end

@implementation LoopViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.groupArray = [[DataManager sharedManager] melodyGroupList];
    [self roundView:self.profileImageView];
    [self roundView:self.centerConsoleView];
    [self roundView:self.consoleView];
    
    [self applyFontAwesome];
    
}

-(void)roundView:(UIView *)view {
    view.layer.cornerRadius = view.frame.size.height / 2;
    view.layer.masksToBounds = YES;
}

-(void)applyFontAwesome {
    self.playButton.titleLabel.font = [UIFont fontAwesomeFontOfSize:self.playButton.titleLabel.frame.size.width - 10];
    
    self.shareButton.titleLabel.font = [UIFont fontAwesomeFontOfSize:35.0f];
    self.playLoopButton.titleLabel.font = [UIFont fontAwesomeFontOfSize:25.0f];
    
    [self.playButton setTitle:[NSString fontAwesomeIconStringForEnum:FAIconPlay] forState:UIControlStateNormal];
    [self.playLoopButton setTitle:[NSString fontAwesomeIconStringForEnum:FAIconRefresh] forState:UIControlStateNormal];
    [self.shareButton setTitle:[NSString fontAwesomeIconStringForEnum:FAIconShareAlt] forState:UIControlStateNormal];
    
    [self.volumeBarButtonItem setTitleTextAttributes:@{
                                         NSFontAttributeName: [UIFont fontAwesomeFontOfSize:20.0f]
                                         } forState:UIControlStateNormal];
    [self.volumeBarButtonItem setTitle:[NSString fontAwesomeIconStringForEnum:FAIconVolumeUp]];
    
    
}

-(IBAction)chooseLoop:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Loops" message:@"Choose a loop" preferredStyle:UIAlertControllerStyleActionSheet];
    
    MelodyGroup *group = self.groupArray[0];
    
    if (group != nil) {
        
        for (Melody *melody in group.melodies) {
            UIAlertAction *action = [UIAlertAction actionWithTitle:melody.melodyName style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                //make the button do something
                [self didSelectMelody:melody];
                
            }];
            [alert addAction:action];
            
        }
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:cancelAction];
    }
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(IBAction)share:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Share to" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *fbAction = [UIAlertAction actionWithTitle:@"Facebook" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //sdf
    }];
    
    UIAlertAction *twAction = [UIAlertAction actionWithTitle:@"Twitter" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //sdf
    }];
    
    UIAlertAction *scAction = [UIAlertAction actionWithTitle:@"SoundCloud" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //sdf
    }];
    
    UIAlertAction *emailAction = [UIAlertAction actionWithTitle:@"E-mail" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //sdf
    }];
    
    UIAlertAction *textAction = [UIAlertAction actionWithTitle:@"Text" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //sdf
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:nil];
    
    [alert addAction:fbAction];
    [alert addAction:twAction];
    [alert addAction:scAction];
    [alert addAction:emailAction];
    [alert addAction:textAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(IBAction)showVolumeSettings:(id)sender {
    
}

-(IBAction)playLoop:(id)sender {
    
}

-(IBAction)toggleRecording:(id)sender {
    
}

-(IBAction)togglePlayback:(id)sender {
    
}

-(void)didSelectMelody:(Melody *)melody {
    [self.chooseLoopButton setTitle:melody.melodyName forState:UIControlStateNormal];
    
    [self loadMelody:melody];
}

-(void)loadMelody:(Melody *)melody {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    NSString *pathString = [NSString stringWithFormat:@"%@/Melodies/%@", documentsPath, melody.fileName];
    //pathString = [pathString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    NSString *filePath = [documentsPath stringByAppendingPathComponent:pathString];
    
    //if file exists, load, set status = loaded,
    if ([fileManager fileExistsAtPath:filePath]) {
        //
        
        self.loopStatusLabel.text = @"Loop loaded!";
        
        self.selectedMelody = melody;
        
    } else {
        //else, download, show progress, set loaded, set play button
        
        self.loopStatusLabel.text = @"Loop downloading (0%)";
        
        [self downloadFile:melody.filePathUrlString toPath:pathString];
    }
}

-(void)downloadFile:(NSString *)sourceFilePath toPath:(NSString *)destinationFilePath {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSString *fullUrlString = [NSString stringWithFormat:@"%@/%@", DOWNLOAD_BASE_URL, sourceFilePath];
    fullUrlString = [fullUrlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *URL = [NSURL URLWithString:fullUrlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSProgress *progress = nil;
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:&progress destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSURL *fileURL = [NSURL fileURLWithPath:destinationFilePath];
        
        return fileURL;
        //NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        //return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        if (error == nil) {
            NSLog(@"File downloaded to: %@", filePath);
            self.loopStatusLabel.text = @"Loop loaded!";
        } else {
            NSLog(@"Download error: %@", error.description);
            self.loopStatusLabel.text = @"Error loading loop";
        }
        [progress removeObserver:self forKeyPath:@"fractionCompleted" context:NULL];
    }];
    [downloadTask resume];
    
    [progress addObserver:self
               forKeyPath:@"fractionCompleted"
                  options:NSKeyValueObservingOptionNew
                  context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"fractionCompleted"]) {
        NSProgress *progress = (NSProgress *)object;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //Wants to update UI or perform any task on main thread.
            double percent = progress.fractionCompleted * 100.0;
            self.loopStatusLabel.text = [NSString stringWithFormat:@"Loop downloading (%.0f%%)", percent];
        });
        
        NSLog(@"Progress… %f", progress.fractionCompleted);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
