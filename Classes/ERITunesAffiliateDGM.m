//
//  ERITunesAffiliateDGM.m
//  iTunesSearchHelper
//
//  Created by Don Mowry on 1/21/11.
//  Copyright 2011 Ethereal Robot, LLC. All rights reserved.
//

#import "ERITunesAffiliateDGM.h"

static NSString * const kDGMWrapper = @"http://www.s2d6.com/x/?x=c&z=s&v=%@&t=";

@implementation ERITunesAffiliateDGM

//generate an affliliate link from an iTunes link
- (NSString *)generateAffiliateLink: (NSURL *)iTunesLink;
{
	NSMutableString *aLink = [NSMutableString stringWithFormat:kDGMWrapper, self.affiliateId];
	
	NSMutableString *url = [NSMutableString stringWithString:[iTunesLink absoluteString]];
	
	NSRange aRange = [url rangeOfString:@"?"];
	if (aRange.location == NSNotFound) {
		[url appendFormat:@"?partnerId=1002"];
	} else {
		[url appendFormat:@"&partnerId=1002"];
	}
	
	url = [NSString stringWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	
	[aLink appendString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	
	return aLink;
}


@end
