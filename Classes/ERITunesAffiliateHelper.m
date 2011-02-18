//
//  ERITunesAffiliateHelper.m
//  iTunesSearchHelper
//
//  Created by Don on 12/10/10.
//  Copyright 2010 Ethereal Robot, LLC. All rights reserved.
//

#import "ERITunesAffiliateHelper.h"
#import <UIKit/UIKit.h>


@implementation ERITunesAffiliateHelper

@synthesize iTunesURL;

- (id) init
{
	self = [super init];
	if (self != nil) {
		//
	}
	return self;
}

- (void) dealloc
{
	[iTunesURL release];
	
	[super dealloc];
}


// Process a LinkShare/TradeDoubler/DGM URL to something iPhone can handle
- (void)openReferralURL:(NSURL *)referralURL;
{
	NSURLRequest *theRequest=[NSURLRequest requestWithURL:referralURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
	NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
	[conn release];
}

// Save the most recent URL in case multiple redirects occur
- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse;
{
	self.iTunesURL = [redirectResponse URL];
	return request;
}

// No more redirects; use the last URL saved
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
{
	[[UIApplication sharedApplication] openURL:self.iTunesURL];
}

@end
