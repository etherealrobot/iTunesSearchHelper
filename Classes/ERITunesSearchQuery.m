//
//  ERITunesSearchQuery.m
//  iTunesSearchHelper
//
//  Created by Don on 9/14/10.
//  Copyright 2010 Ethereal Robot, LLC. All rights reserved.
//

#import "ERITunesSearchQuery.h"
#import "ERITunesSearchErrors.h"

//http://developer.apple.com/library/ios/#qa/qa2008/qa1629.html
//http://www.apple.com/itunes/affiliates/resources/documentation/linking-to-the-itunes-music-store.html

/*
term : space = +, URL encoded
country : US
media : movie, podcast, music, musicVideo, audiobook, shortFilm, tvShow, all
entity 
attribute
x callback x
limit : 1 - 200
lang : en_us, ja_jp
version : 1, 2
explicit : BOOL


*/ 

static NSInteger const kERITunesSearchLimitLowerBound = 0;
static NSInteger const kERITunesSearchLimitUpperBound = 200;
static NSInteger const kERITunesSearchLimitDefault = 100;

static NSInteger const kERITunesSearchVersionLowerBound = 1;
static NSInteger const kERITunesSearchVersionUpperBound = 2;
static NSInteger const kERITunesSearchVersionDefault = 2;

@interface ERITunesSearchQuery()

@property (nonatomic, retain) NSMutableDictionary* parameters;
@property (nonatomic, retain) NSArray *mediaTerms;
@property (nonatomic, retain) NSDictionary *mediaEntities;
@property (nonatomic, retain) NSDictionary *mediaAttributes;

@end


@implementation ERITunesSearchQuery

@synthesize parameters, mediaTerms, mediaEntities, mediaAttributes;

- (id) init
{
	self = [super init];
	if (self != nil) {
		parameters = [NSMutableDictionary dictionaryWithCapacity:10];
		//required default
		[parameters setValue:@"US" forKey:@"country"];
		
		mediaTerms = [NSArray arrayWithObjects: @"movie", @"podcast", @"music", 
					  @"musicVideo", @"audiobook", @"shortFilm", @"tvShow", @"software", @"all", nil];
		
		mediaEntities = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
															 [NSArray arrayWithObjects: @"movieArtist", @"movie", nil],
															 [NSArray arrayWithObjects: @"podcastAuthor", @"podcast", nil],
															 [NSArray arrayWithObjects:	@"musicArtist", @"musicTrack", @"album", @"musicVideo", @"mix", nil],
															 [NSArray arrayWithObjects: @"musicArtist", @"musicVideo", nil],
															 [NSArray arrayWithObjects:	@"audiobookAuthor", @"audiobook", nil],
															 [NSArray arrayWithObjects: @"shortFilmArtist", @"shortFilm", nil],
															 [NSArray arrayWithObjects:	@"tvEpisode", @"tvSeason", nil],
															 [NSArray arrayWithObjects: @"software", nil],
															 [NSArray arrayWithObjects: @"movie", @"album", @"allArtist", @"podcast", @"musicVideo", @"mix", @"audiobook", @"tvSeason", @"allTrack", nil],
															 nil]
													forKeys:mediaTerms];

		mediaAttributes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
															 [NSArray arrayWithObjects: @"actorTerm", @"genreIndex", @"artistTerm", @"shortFilmTerm", @"producerTerm", @"ratingTerm", @"directorTerm", @"releaseYearTerm", @"featureFilmTerm", @"movieArtistTerm", @"movieTerm", @"ratingIndex", @"descriptionTerm", nil],
															 [NSArray arrayWithObjects: @"titleTerm", @"languageTerm", @"authorTerm", @"genreIndex", @"artistTerm", @"ratingIndex", @"keywordsTerm", @"descriptionTerm", nil],
															 [NSArray arrayWithObjects:	@"mixTerm", @"genreIndex", @"artistTerm", @"composerTerm", @"albumTerm", @"ratingIndex", @"songTerm", @"musicTrackTerm", nil],
															 [NSArray arrayWithObjects: @"genreIndex", @"artistTerm", @"albumTerm", @"ratingIndex", @"songTerm", nil],
															 [NSArray arrayWithObjects:	@"titleTerm", @"authorTerm", @"genreIndex", @"ratingIndex", nil],
															 [NSArray arrayWithObjects: @"genreIndex", @"artistTerm", @"shortFilmTerm", @"ratingIndex", @"descriptionTerm", nil],
															 [NSArray arrayWithObjects:	@"genreIndex", @"tvEpisodeTerm", @"showTerm", @"tvSeasonTerm", @"ratingIndex", @"descriptionTerm", nil],
															 [NSArray arrayWithObjects: @"softwareDeveloper", nil],
															 [NSArray arrayWithObjects: @"actorTerm", @"languageTerm", @"allArtistTerm", @"tvEpisodeTerm", @"shortFilmTerm", @"directorTerm", @"releaseYearTerm", @"titleTerm", @"featureFilmTerm", @"ratingIndex", @"keywordsTerm", @"descriptionTerm", @"authorTerm", @"genreIndex", @"mixTerm", @"allTrackTerm", @"artistTerm", @"composerTerm", @"tvSeasonTerm", @"producerTerm", @"ratingTerm", @"songTerm", @"movieArtistTerm", @"showTerm", @"movieTerm", @"albumTerm", nil],
															 nil]
													forKeys:mediaTerms];
	}
	return self;
}

-(NSString*) queryString;
{
	NSMutableString *qs = [NSMutableString stringWithFormat:@"term=%@", self.term];
	
	for (NSString *key in [parameters allKeys])
	{ 
		if (![key isEqual:@"term"]) {
			[qs appendFormat:@"&%@=%@", key, [parameters valueForKey:key]];
		}
	}
	
	return [[qs copy] autorelease];
}


-(NSString*) term;
{
	return [[[parameters valueForKey:@"term"] copy] autorelease];
}

-(NSString*) country; // : US
{
	return [[[parameters valueForKey:@"country"] copy] autorelease];
}

-(NSString*) media; // movie, podcast, music, musicVideo, audiobook, shortFilm, tvShow, all
{
	return [[[parameters valueForKey:@"media"] copy] autorelease];
}

-(NSString*) mediaEntity; //see rules in validate
{
	return [[[parameters valueForKey:@"entity"] copy] autorelease];
}

-(NSString*) mediaAttribute; //see rules in validate
{
	return [[[parameters valueForKey:@"attribute"] copy] autorelease];
}

-(NSInteger) limit; // : 1 - 200
{
	NSNumber* value = [parameters valueForKey:@"limit"];
	if (value == nil)
		//return the default
		return kERITunesSearchLimitDefault;
	
	return [value integerValue];
}

-(NSString*) lang; // : en_us, ja_jp
{
	return [[[parameters valueForKey:@"lang"] copy] autorelease];
}

-(NSInteger) version; // : 1, 2
{
	NSNumber* value = [parameters valueForKey:@"version"];
	if (value == nil)
		//return the default
		return kERITunesSearchVersionDefault;
	
	return [value integerValue];
}

-(BOOL) includeExplicit;
{
	NSNumber* value = [parameters valueForKey:@"explicit"];
	if (value == nil)
		//return the default
		return YES;
	
	return [value boolValue];
}

-(void) setTerm:(NSString*) value;
{
	NSString *result = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, 
																			(CFStringRef)value, 
																			CFSTR(" "), 
																			CFSTR(":/?#[]@!$&’()*+,;="), 
																			kCFStringEncodingUTF8);
	[result autorelease];

	[parameters setValue:[result stringByReplacingOccurrencesOfString:@" " withString:@"+"]
				  forKey:@"term"];
}

-(void) setCountry:(NSString*) value;
{
	[parameters setValue:value forKey:@"country"];
}

-(void) setMedia:(NSString*) value;
{
	[parameters setValue:value forKey:@"media"];
}

-(void) setMediaEntity:(NSString*) value;
{
	[parameters setValue:value forKey:@"entity"];
}

-(void) setMediaAttribute:(NSString*) value;
{
	[parameters setValue:value forKey:@"attribute"];
}

-(void) setLimit:(NSInteger) value;
{
	[parameters setValue:[NSNumber numberWithInteger:value] forKey:@"limit"];
}

-(void) setLang:(NSString*) value;
{
	[parameters setValue:value forKey:@"lang"];
}

-(void) setVersion:(NSInteger) value;
{
	[parameters setValue:[NSNumber numberWithInteger:value]  forKey:@"version"];
}

-(void) setIncludeExplicit:(BOOL) flag;
{
	[parameters setValue:[NSNumber numberWithBool:flag]  forKey:@"explicit"];
}


-(BOOL)validateMedia:(id *)ioValue error:(NSError **)outError;
{
	if (*ioValue == nil)
	{
		return YES;
	}
	
	if ([[self mediaTerms] indexOfObject:*ioValue] < 0) 
	{
		NSString *errorString = NSLocalizedStringFromTable(
														   @"Media must be one of the following terms (in English): movie, podcast, music, musicVideo, audiobook, shortFilm, tvShow, all",
														   @"ERITunesSearch",
														   @"validation: media error");
		NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
																 forKey:NSLocalizedDescriptionKey];
		NSError *error = [[[NSError alloc] initWithDomain:@"ERITunesSearch"
													 code:ERITunesSearchMediaError
												 userInfo:userInfoDict] autorelease];
		*outError = error;
		return NO;
	}
	
	if ([self mediaEntity] == nil) 
	{
		NSArray *entityArray = [[self mediaEntities] objectForKey:*ioValue];
		if ([entityArray indexOfObject:[self mediaEntity]] < 0) 
		{
			NSString *errorString = NSLocalizedStringFromTable(
															   @"Media is not valid for set entity type",
															   @"ERITunesSearch",
															   @"validation: media error");
			NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
																	 forKey:NSLocalizedDescriptionKey];
			NSError *error = [[[NSError alloc] initWithDomain:@"ERITunesSearch"
														 code:ERITunesSearchMediaError
													 userInfo:userInfoDict] autorelease];
			*outError = error;
			return NO;
		}
	}
	
	if ([self mediaAttribute] == nil) 
	{
		NSArray *attributeArray = [[self mediaAttributes] objectForKey:*ioValue];
		if ([attributeArray indexOfObject:[self mediaAttribute]] < 0) 
		{
			NSString *errorString = NSLocalizedStringFromTable(
															   @"Media is not valid for set attribute type",
															   @"ERITunesSearch",
															   @"validation: media error");
			NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
																	 forKey:NSLocalizedDescriptionKey];
			NSError *error = [[[NSError alloc] initWithDomain:@"ERITunesSearch"
														 code:ERITunesSearchMediaError
													 userInfo:userInfoDict] autorelease];
			*outError = error;
			return NO;
		}
	}
	
	return YES;
}

-(BOOL)validateMediaEntity:(id *)ioValue error:(NSError **)outError;
{
	if (*ioValue == nil)
	{
		return YES;
	}
	
	if ([self media] == nil)
	{
		return YES;
	}
	else
	{
		NSArray *entityArray = [[self mediaEntities] objectForKey:[self media]];
		if ([entityArray indexOfObject:*ioValue] < 0) 
		{
			NSString *errorString = NSLocalizedStringFromTable(
															   @"Entity is not valid for set media type",
															   @"ERITunesSearch",
															   @"validation: entity error");
			NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
																	 forKey:NSLocalizedDescriptionKey];
			NSError *error = [[[NSError alloc] initWithDomain:@"ERITunesSearch"
														 code:ERITunesSearchMediaEntityError
													 userInfo:userInfoDict] autorelease];
			*outError = error;
			return NO;
		}
	}
	
	return YES;
}

-(BOOL)validateMediaAttibute:(id *)ioValue error:(NSError **)outError;
{
	if (*ioValue == nil)
	{
		return YES;
	}
	
	if ([self media] == nil)
	{
		return YES;
	}
	else
	{
		NSArray *attributeArray = [[self mediaAttributes] objectForKey:[self media]];
		if ([attributeArray indexOfObject:*ioValue] < 0) 
		{
			NSString *errorString = NSLocalizedStringFromTable(
															   @"Attribute is not valid for set media type",
															   @"ERITunesSearch",
															   @"validation: attribute error");
			NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
																	 forKey:NSLocalizedDescriptionKey];
			NSError *error = [[[NSError alloc] initWithDomain:@"ERITunesSearch"
														 code:ERITunesSearchMediaAttributeError
													 userInfo:userInfoDict] autorelease];
			*outError = error;
			return NO;
		}
	}
	
	return YES;
}

-(BOOL)validateLimit:(id *)ioValue error:(NSError **)outError;
{
	if (*ioValue == nil)
	{
		return YES;
	}
	
	if ([*ioValue integerValue] <= kERITunesSearchLimitLowerBound || 
		[*ioValue integerValue] <= kERITunesSearchLimitUpperBound)
	{
		return YES;
	}
	
	NSString *errorString = NSLocalizedStringFromTable(
													   @"Limit must be within bounds", @"ERITunesSearch",
													   @"validation: limit error");
	NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
															 forKey:NSLocalizedDescriptionKey];
	NSError *error = [[[NSError alloc] initWithDomain:@"ERITunesSearch"
												 code:ERITunesSearchLimitError
											 userInfo:userInfoDict] autorelease];
	outError = &error;
	return NO;
}

-(BOOL)validateLang:(id *)ioValue error:(NSError **)outError;
{
	if (*ioValue == nil)
	{
		return YES;
	}
	
	if ([*ioValue isEqualToString:@"en_us"] ||
		[*ioValue isEqualToString:@"ja_jp"]) {
		return YES;
	}
	
	NSString *errorString = NSLocalizedStringFromTable(
													   @"Lang must be either en_us or ja_jp", @"ERITunesSearch",
													   @"validation: lang error");
	NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
															 forKey:NSLocalizedDescriptionKey];
	NSError *error = [[[NSError alloc] initWithDomain:@"ERITunesSearch"
												 code:ERITunesSearchLangError
											 userInfo:userInfoDict] autorelease];
	outError = &error;
	return NO;
}

-(BOOL)validateVersion:(id *)ioValue error:(NSError **)outError;
{
	if (*ioValue == nil)
	{
		return YES;
	}
	
	if ([*ioValue integerValue] <= kERITunesSearchVersionLowerBound || 
		[*ioValue integerValue] <= kERITunesSearchVersionUpperBound)
	{
		return YES;
	}
	
	NSString *errorString = NSLocalizedStringFromTable(
													   @"Version must be within bounds", @"ERITunesSearch",
													   @"validation: version error");
	NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
															 forKey:NSLocalizedDescriptionKey];
	NSError *error = [[[NSError alloc] initWithDomain:@"ERITunesSearch"
												 code:ERITunesSearchVersionError
											 userInfo:userInfoDict] autorelease];
	outError = &error;
	return NO;
}




@end
