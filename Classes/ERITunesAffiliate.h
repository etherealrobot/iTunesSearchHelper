//
//  ERITunesAffiliate.h
//  iTunesSearchHelper
//
//  Created by Don Mowry on 1/21/11.
//  Copyright 2011 Ethereal Robot, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ERITunesAffiliate : NSObject {
	NSString *affiliateId;
	NSString *programId;
	
}

@property (nonatomic, retain) NSString *affiliateId;
@property (nonatomic, retain) NSString *programId;

- (NSString *)generateAffiliateLink: (NSURL *)iTunesLink;

@end
