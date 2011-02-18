//
//  ERITunesAffiliateLinkShare.m
//  iTunesSearchHelper
//
//  Created by Don Mowry on 1/21/11.
//  Copyright 2011 Ethereal Robot, LLC. All rights reserved.
//

#import "ERITunesAffiliateLinkShare.h"

static NSString * const kLinkShareWrapper = @"http://click.linksynergy.com/fs-bin/stat?id=%@&offerid=146261&type=3&subid=0&tmpid=1826&RD_PARM1=";

@implementation ERITunesAffiliateLinkShare

//generate an affliliate link from an iTunes link
- (NSString *)generateAffiliateLink: (NSURL *)iTunesLink;
{
	NSMutableString *aLink = [NSMutableString stringWithFormat:kLinkShareWrapper, self.affiliateId];
	
	NSMutableString *url = [NSMutableString stringWithString:[iTunesLink absoluteString]];
	
	NSRange aRange = [url rangeOfString:@"?"];
	if (aRange.location == NSNotFound) {
		[url appendFormat:@"?partnerId=30"];
	} else {
		[url appendFormat:@"&partnerId=30"];
	}
	
	url = [NSString stringWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
		
	[aLink appendString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	
	return aLink;
}

@end
