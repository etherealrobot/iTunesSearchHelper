//
//  ERITunesAffiliateHelper.h
//  iTunesSearchHelper
//
//  Created by Don on 12/10/10.
//  Copyright 2010 Ethereal Robot, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

//cf. http://developer.apple.com/library/ios/#qa/qa2008/qa1629.html


@interface ERITunesAffiliateHelper : NSObject {
	
	NSURL * iTunesURL;
}

@property (nonatomic, retain) NSURL * iTunesURL;

- (void)openReferralURL:(NSURL *)referralURL;


@end
