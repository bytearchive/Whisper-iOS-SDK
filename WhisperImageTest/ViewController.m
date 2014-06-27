//
//  ViewController.m
//  WhisperImageTest
//
//  Created by whisper on 6/23/14.
//  Copyright (c) 2014 Whisper. All rights reserved.
//

#import "ViewController.h"
#import "WHPWhisperAppClient.h"

@interface ViewController () <UIDocumentInteractionControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSURL* url;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.url = [[NSBundle mainBundle] URLForResource:@"beyonce" withExtension:@"jpg"];
    NSAssert(self.url, @"no url!");
    
    UIImage* image = [UIImage imageWithContentsOfFile:self.url.path];
    NSAssert(image, @"image is nil");
    self.imageView.clipsToBounds = YES;
    self.imageView.image = image;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.imageView sizeToFit];
    
    UIButton* button = [WHPWhisperAppClient whisperButtonWithSize:kWHPWhisperAppClientButtonSize_Medium rounded:YES];
    button.center = CGPointMake(160,500);
    [button addTarget:self action:@selector(openButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (IBAction)openButton:(id)sender {
    BOOL result;
    
    NSError* error;
    
    WHPWhisperAppClient* manager = [WHPWhisperAppClient sharedManager];
    manager.mode = WHPWhisperAppClientModeMenuFromView;
    manager.view = self.imageView;
    manager.rect = self.imageView.bounds;
    manager.animated = YES;
    result = [manager createWhisperWithURL:self.url error:&error];

    if (!result) {
        NSLog(@"%@", error.description);
    }
}


- (UIView *)documentInteractionControllerViewForPreview:(UIDocumentInteractionController *)controller {
    return self.imageView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
