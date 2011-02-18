//
//  ERITunesAffiliateTradeDoubler.m
//  iTunesSearchHelper
//
//  Created by Don Mowry on 1/21/11.
//  Copyright 2011 Ethereal Robot, LLC. All rights reserved.
//

#import "ERITunesAffiliateTradeDoubler.h"

static NSString * const kTradeDoublerWrapper = @"http://clk.tradedoubler.com/click?p=%@&a=%@&url=ITUNES_URL";

@implementation ERITunesAffiliateTradeDoubler

//generate an affliliate link from an iTunes link
- (NSString *)generateAffiliateLink: (NSURL *)iTunesLink;
{
	NSMutableString *aLink = [NSMutableString stringWithFormat:kTradeDoublerWrapper, self.programId, self.affiliateId];
	
	NSMutableString *url = [NSMutableString stringWithString:[iTunesLink absoluteString]];
	
	NSRange aRange = [url rangeOfString:@"?"];
	if (aRange.location == NSNotFound) {
		[url appendFormat:@"?partnerId=2003"];
	} else {
		[url appendFormat:@"&partnerId=2003"];
	}
	
	url = [NSString stringWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	
	[aLink appendString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	
	return aLink;
}


@end
