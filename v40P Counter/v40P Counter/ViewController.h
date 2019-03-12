//
//  ViewController.h
//  v40P Counter
//
//  Created by Frank Deo on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController <ADBannerViewDelegate, UITextFieldDelegate> {
    
    ADBannerView *bannerView;
    BOOL bannerIsVisible;
    IBOutlet UITextField *maxPitchesField;
    IBOutlet UIProgressView *progressView;
    IBOutlet UITextView *pitchCount;
    IBOutlet UIButton *disableKBButton;
    
    int maxPitchesInt;
    int pitchesInt;
    float pitchProgressInt;

}

- (IBAction) addPitch:(id)sender;
- (IBAction) removePitch:(id)sender;
- (IBAction) resetPitches:(id)sender;
- (IBAction) closeKB:(id)sender;

@property (nonatomic,assign) BOOL bannerIsVisible;

@end
