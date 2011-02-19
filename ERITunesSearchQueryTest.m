//
//  ERITunesSearchQueryTest.m
//  iTunesSearchHelper
//
//  Created by Don on 2/18/11.
//  Copyright 2011 Ethereal Robot, LLC. All rights reserved.
//

#import "ERITunesSearchQuery.h"

#import <SenTestingKit/SenTestingKit.h>

@interface ERITunesSearchQueryTest : SenTestCase

@end



@implementation ERITunesSearchQueryTest

- (void) testTerm {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	[searchQuery setTerm:@"Elvis Costello"];
	
    STAssertTrue([[searchQuery term] isEqualToString:@"Elvis+Costello"], @"Term Incorrect" );
	
	[searchQuery release];
    
}

- (void) testDefaultCountry {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	STAssertTrue([[searchQuery country] isEqualToString:@"US"], @"Default Country Incorrect" );
	
	[searchQuery release];
    
}

- (void) testCountry {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	[searchQuery setCountry:@"CA"];
	
    STAssertTrue([[searchQuery country] isEqualToString:@"CA"], @"Country Incorrect" );
	
	[searchQuery release];
    
}

- (void) testMedia {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	[searchQuery setMedia:@"music"];
	
    STAssertTrue([[searchQuery media] isEqualToString:@"music"], @"Media Incorrect" );
	
	[searchQuery release];
    
}

- (void) testMediaEntity {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	[searchQuery setMediaEntity:@"musicArtist"];
	
    STAssertTrue([[searchQuery mediaEntity] isEqualToString:@"musicArtist"], @"Media Entity Incorrect" );
	
	[searchQuery release];
    
}

- (void) testMediaAttribute {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	[searchQuery setMediaAttribute:@"musicTerm"];
	
    STAssertTrue([[searchQuery mediaAttribute] isEqualToString:@"musicTerm"], @"Media Attribute Incorrect" );
	
	[searchQuery release];
    
}

- (void) testLimit {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	[searchQuery setLimit:10];
	
	STAssertEquals(10, [searchQuery limit], @"Limit Incorrect" );
	
	[searchQuery release];
    
}

- (void) testLang {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	[searchQuery setLang:@"en-US"];
	
    STAssertTrue([[searchQuery lang] isEqualToString:@"en-US"], @"Lang Incorrect" );
	
	[searchQuery release];
    
}

- (void) testVersion {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	[searchQuery setVersion:10];
	
	STAssertEquals(10, [searchQuery version], @"Limit Version" );
	
	[searchQuery release];
    
}

- (void) testIncludeExplicit {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	[searchQuery setIncludeExplicit:YES];
	
	STAssertEquals(YES, [searchQuery includeExplicit], @"Include Explicit Version" );
	
	[searchQuery release];
    
}


- (void) testMediaValidation {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	NSError *validationError;
	NSString *media = [NSString stringWithString:@"invalidMedia"];
	
	[searchQuery validateValue:&media forKey:@"media" error:&validationError];
    //[searchQuery validateMediaEntity:&mediaEntity error:&validationError];
	
	STAssertNotNil(validationError, @"Should not accept invalid Media");
	
	[searchQuery release];
    
}

- (void) testMediaValidationForMediaEntity {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	[searchQuery setMediaEntity:@"movie"];
	
	NSError *validationError;
	NSString *media = [NSString stringWithString:@"music"];
	
	[searchQuery validateValue:&media forKey:@"media" error:&validationError];
	
	STAssertNotNil(validationError, @"Should not accept invalid Media / Media Entity combinations");
	
	[searchQuery release];
    
}

- (void) testMediaValidationForMediaAttribute {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	[searchQuery setMediaAttribute:@"movieTerm"];
	
	NSError *validationError;
	NSString *media = [NSString stringWithString:@"music"];
	
	[searchQuery validateValue:&media forKey:@"media" error:&validationError];
	
	STAssertNotNil(validationError, @"Should not accept invalid Media / Media Attribute combinations");
	
	[searchQuery release];
    
}

- (void) testMediaEntityValidation {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	[searchQuery setMedia:@"music"];
	
	NSError *validationError;
	NSString *mediaEntity = [NSString stringWithString:@"movie"];
	
	[searchQuery validateValue:&mediaEntity forKey:@"mediaEntity" error:&validationError];
    //[searchQuery validateMediaEntity:&mediaEntity error:&validationError];
	
	STAssertNotNil(validationError, @"Should not accept invalid Media Entities");
	
	[searchQuery release];
    
}

- (void) testMediaAttributeValidation {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	[searchQuery setMedia:@"music"];
	
	NSError *validationError;
	NSString *mediaAttribute = [NSString stringWithString:@"movie"];
	
	[searchQuery validateValue:&mediaAttribute forKey:@"mediaAttribute" error:&validationError];
    //[searchQuery validateMediaEntity:&mediaEntity error:&validationError];
	
	STAssertNotNil(validationError, @"Should not accept invalid Media Attribute");
	
	[searchQuery release];
    
}

- (void) testLimitValidation {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	NSError *validationError;
	NSNumber *limit = [NSNumber numberWithInt:4444];
	
	[searchQuery validateValue:&limit forKey:@"limit" error:&validationError];
    
	STAssertNotNil(validationError, @"Should not accept invalid limits");
	
	[searchQuery release];
    
}

- (void) testLangValidation {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	NSError *validationError;
	NSString *lang = @"fr-FR";
	
	[searchQuery validateValue:&lang forKey:@"lang" error:&validationError];
    
	STAssertNotNil(validationError, @"Should not accept invalid lang");
	
	[searchQuery release];
    
}

- (void) testVersionValidation {
	
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	NSError *validationError;
	NSNumber *version = [NSNumber numberWithInt:4];
	
	[searchQuery validateValue:&version forKey:@"version" error:&validationError];
    
	STAssertNotNil(validationError, @"Should not accept invalid versions");
	
	[searchQuery release];
    
}

- (void) testQueryString {
	ERITunesSearchQuery *searchQuery = [[ERITunesSearchQuery alloc] init];
	
	[searchQuery setTerm:@"The Avett Brothers"];
	[searchQuery setCountry:@"FI"];
	[searchQuery setMedia:@"music"];
	[searchQuery setMediaEntity:@"musicArtist"];
	[searchQuery setMediaAttribute:@"artistTerm"];
	[searchQuery setLimit:10];
	[searchQuery setLang:@"en_us"];
	[searchQuery setVersion:2];
	
	STAssertTrue([@"term=The+Avett+Brothers&entity=musicArtist&limit=10&media=music&country=FI&lang=en_us&version=2&attribute=artistTerm" isEqualToString:[searchQuery queryString]], 
				   @"Query String incorrect");
	
	[searchQuery release];
}

@end
