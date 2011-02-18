//
//  ERITunesAffiliate.m
//  iTunesSearchHelper
//
//  Created by Don Mowry on 1/21/11.
//  Copyright 2011 Ethereal Robot, LLC. All rights reserved.
//

#import "ERITunesAffiliate.h"
#import "ERITunesAffiliateLinkShare.h"
#import "ERITunesAffiliateTradeDoubler.h"
#import "ERITunesAffiliateDGM.h"


@implementation ERITunesAffiliate

@synthesize affiliateId;
@synthesize programId;

+ (ERITunesAffiliate *) affiliateObjectForCountry:(NSString *) country
{
	if ([@"US" isEqualToString:country] || 
		[@"CA" isEqualToString:country] || 
		[@"JA" isEqualToString:country]) {
		return [[[ERITunesAffiliateLinkShare alloc] init] autorelease];
	}
	
	if ([@"AU" isEqualToString:country] || 
		[@"NZ" isEqualToString:country]) {
		return [[[ERITunesAffiliateDGM alloc] init] autorelease];
	}
	
	if ([@"AT" isEqualToString:country]) {
		ERITunesAffiliateTradeDoubler* ia = [[ERITunesAffiliateDGM alloc] init];
		ia.programId = 	@"24380";
		return [ia autorelease];
	}
	
	if ([@"BE" isEqualToString:country]) {
		ERITunesAffiliateTradeDoubler* ia = [[ERITunesAffiliateDGM alloc] init];
		ia.programId = 	@"224379";
		return [ia autorelease];
	}
		 
	if ([@"CH" isEqualToString:country]) {
		ERITunesAffiliateTradeDoubler* ia = [[ERITunesAffiliateDGM alloc] init];
		ia.programId = 	@"224372";
		return [ia autorelease];
	}
			  
	if ([@"DE" isEqualToString:country]) {
		ERITunesAffiliateTradeDoubler* ia = [[ERITunesAffiliateDGM alloc] init];
		ia.programId = 	@"223761";
		return [ia autorelease];
	}
				   
	if ([@"DK" isEqualToString:country]) {
		ERITunesAffiliateTradeDoubler* ia = [[ERITunesAffiliateDGM alloc] init];
		ia.programId = 	@"224375";
		return [ia autorelease];
	}
						
	if ([@"ES" isEqualToString:country]) {
		ERITunesAffiliateTradeDoubler* ia = [[ERITunesAffiliateDGM alloc] init];
		ia.programId = 	@"224364";
		return [ia autorelease];
	}
							 
	if ([@"FI" isEqualToString:country]) {
		ERITunesAffiliateTradeDoubler* ia = [[ERITunesAffiliateDGM alloc] init];
		ia.programId = 	@"224366";
		return [ia autorelease];
	}
								  
	if ([@"FR" isEqualToString:country]) {
		ERITunesAffiliateTradeDoubler* ia = [[ERITunesAffiliateDGM alloc] init];
		ia.programId = 	@"223753";
		return [ia autorelease];
	}
									   
	if ([@"GB" isEqualToString:country]) {
		ERITunesAffiliateTradeDoubler* ia = [[ERITunesAffiliateDGM alloc] init];
		ia.programId = 	@"223708";
		return [ia autorelease];
	}
											
	if ([@"IE" isEqualToString:country]) {
		ERITunesAffiliateTradeDoubler* ia = [[ERITunesAffiliateDGM alloc] init];
		ia.programId = 	@"224367";
		return [ia autorelease];
	}
												 
	if ([@"IT" isEqualToString:country]) {
		ERITunesAffiliateTradeDoubler* ia = [[ERITunesAffiliateDGM alloc] init];
		ia.programId = 	@"224373";
		return [ia autorelease];
	}
													  
	if ([@"NL" isEqualToString:country]) {
		ERITunesAffiliateTradeDoubler* ia = [[ERITunesAffiliateDGM alloc] init];
		ia.programId = 	@"224371";
		return [ia autorelease];
	}
														   
	if ([@"NO" isEqualToString:country]) {
		ERITunesAffiliateTradeDoubler* ia = [[ERITunesAffiliateDGM alloc] init];
		ia.programId = 	@"224369";
		return [ia autorelease];
	}
																
	if ([@"SE" isEqualToString:country]) {
		ERITunesAffiliateTradeDoubler* ia = [[ERITunesAffiliateDGM alloc] init];
		ia.programId = 	@"223762";
		return [ia autorelease];
	}
																
	return nil;
	
}

- (void) dealloc
{
	[programId release];
	[affiliateId release];
	[super dealloc];
}

//generate an affliliate link from an iTunes link
- (NSString *)generateAffiliateLink: (NSURL *)iTunesLink;
{
	return [iTunesLink absoluteString];
}


@end
