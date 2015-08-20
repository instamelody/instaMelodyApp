//
//  LoopViewController.h
//  InstaMelody
//
//  Created by Ahmed Bakir on 8/17/15.
//  Copyright (c) 2015 InstaMelody. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoopViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIBarButtonItem *volumeBarButtonItem;

@property (nonatomic, strong) IBOutlet UIButton *chooseLoopButton;
@property (nonatomic, strong) IBOutlet UIButton *playLoopButton;
@property (nonatomic, strong) IBOutlet UIButton *shareButton;

@property (nonatomic, strong) IBOutlet UIButton *recordButton;
@property (nonatomic, strong) IBOutlet UIButton *playButton;

@property (nonatomic, strong) IBOutlet UILabel *topicLabel;
@property (nonatomic, strong) IBOutlet UILabel *loopStatusLabel;

@property (nonatomic, strong) IBOutlet UIView *consoleView;
@property (nonatomic, strong) IBOutlet UIView *centerConsoleView;
@property (nonatomic, strong) IBOutlet UIView *progressView;
@property (nonatomic, strong) IBOutlet UIImageView *profileImageView;

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UICollectionView *participantsView;

-(IBAction)showVolumeSettings:(id)sender;
-(IBAction)share:(id)sender;
-(IBAction)chooseLoop:(id)sender;
-(IBAction)playLoop:(id)sender;
-(IBAction)toggleRecording:(id)sender;
-(IBAction)togglePlayback:(id)sender;


@end
