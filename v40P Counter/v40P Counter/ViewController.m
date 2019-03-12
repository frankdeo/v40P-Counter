//
//  ViewController.m
//  v40P Counter
//
//  Created by Frank Deo on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize bannerIsVisible;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [maxPitchesField setDelegate:self];
    
    bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;

    pitchCount.text = @"0";
    progressView.progress = 0.00;
    maxPitchesInt = 0;
    pitchesInt = 0;
    pitchProgressInt = 0.0;
    disableKBButton.hidden = YES;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);

}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        banner.frame = CGRectOffset(banner.frame, 0, 50);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // banner is visible and we move it out of the screen, due to connection issue
        banner.frame = CGRectOffset(banner.frame, 0, -50);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
    }
}

- (IBAction) addPitch:(id)sender {
    
    maxPitchesInt = [maxPitchesField.text intValue];
    
    pitchesInt = [pitchCount.text intValue];
    
    pitchProgressInt = 1.0 / maxPitchesInt;
    
    if (pitchesInt != maxPitchesInt) {
        pitchesInt = pitchesInt + 1;
        pitchCount.text = [NSString stringWithFormat: @"%d", pitchesInt];
        
        if ((pitchesInt >= (maxPitchesInt / 2)) && (pitchesInt < (maxPitchesInt - 10))) {
            
            progressView.progressTintColor = [UIColor yellowColor];
            progressView.progress = (progressView.progress + (float)pitchProgressInt);
        }    
        else if (pitchesInt >= (maxPitchesInt - 10)) {
                
            progressView.progressTintColor = [UIColor redColor];
            progressView.progress = (progressView.progress + (float)pitchProgressInt);
                
        }
        else {  
            
            progressView.progressTintColor = [UIColor greenColor];
            progressView.progress = (progressView.progress + (float)pitchProgressInt);
        }
            
    }
    
}

- (IBAction) removePitch:(id)sender {
    
    maxPitchesInt = [maxPitchesField.text intValue];
    
    pitchesInt = [pitchCount.text intValue];
    
    pitchProgressInt = 1.0 / maxPitchesInt;
    
    if (pitchesInt > 0) {
        pitchesInt = pitchesInt - 1;
        pitchCount.text = [NSString stringWithFormat: @"%d", pitchesInt];
        
        if ((pitchesInt >= (maxPitchesInt / 2)) && (pitchesInt < (maxPitchesInt - 10))) {
            
            progressView.progressTintColor = [UIColor yellowColor];
            progressView.progress = (progressView.progress - (float)pitchProgressInt);
        }    
        else if (pitchesInt >= (maxPitchesInt - 10)) {
            
            progressView.progressTintColor = [UIColor redColor];
            progressView.progress = (progressView.progress - (float)pitchProgressInt);
            
        }
        else {
            
            progressView.progressTintColor = [UIColor greenColor];
            progressView.progress = (progressView.progress - (float)pitchProgressInt);
        }
        
    }
    else {
        progressView.progress = 0.0;
    }
}

- (IBAction) resetPitches:(id)sender {
    
    pitchCount.text = @"0";
    progressView.progress = 0.00;
    maxPitchesInt = 0;
    pitchesInt = 0;
    pitchProgressInt = 0.0;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [maxPitchesField resignFirstResponder];
    
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    
    disableKBButton.hidden = NO;
    maxPitchesField.text = @"";
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.frame = CGRectMake(0,-150,320,460);
    [UIView commitAnimations];
    
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.frame = CGRectMake(0,20,320,460);
    [UIView commitAnimations];
    disableKBButton.hidden = YES;

}

- (IBAction) closeKB:(id)sender {
    
    [maxPitchesField resignFirstResponder];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.frame = CGRectMake(0,20,320,460);
    [UIView commitAnimations];
    disableKBButton.hidden = YES;
}

@end
