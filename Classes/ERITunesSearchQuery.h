//
//  ERITunesSearchQuery.h
//  iTunesSearchHelper
//
//  Created by Don on 9/14/10.
//  Copyright 2010 Ethereal Robot, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ERITunesSearchQuery : NSObject {
	
	@private NSMutableDictionary *parameters;
	@private NSArray *mediaTerms;
	@private NSDictionary *mediaEntities;
	@private NSDictionary *mediaAttributes;

}

-(NSString*) queryString;

-(NSString*) term;
-(NSString*) country; // : US
-(NSString*) media; // movie, podcast, music, musicVideo, audiobook, shortFilm, tvShow, all
-(NSString*) mediaEntity; //see rules in validate
-(NSString*) mediaAttribute; //see rules in validate
-(NSInteger) limit; // : 1 - 200
-(NSString*) lang; // : en_us, ja_jp
-(NSInteger) version; // : 1, 2
-(BOOL) includeExplicit;

-(void) setTerm:(NSString*) value;
-(void) setCountry:(NSString*) value;
-(void) setMedia:(NSString*) value;
-(void) setMediaEntity:(NSString*) value;
-(void) setMediaAttribute:(NSString*) value;
-(void) setLimit:(NSInteger) value;
-(void) setLang:(NSString*) value;
-(void) setVersion:(NSInteger) value;
-(void) setIncludeExplicit:(BOOL) flag;

-(BOOL)validateMedia:(id *)ioValue error:(NSError **)outError;
-(BOOL)validateMediaEntity:(id *)ioValue error:(NSError **)outError;
-(BOOL)validateMediaAttibute:(id *)ioValue error:(NSError **)outError;
-(BOOL)validateLimit:(id *)ioValue error:(NSError **)outError;
-(BOOL)validateLang:(id *)ioValue error:(NSError **)outError;
-(BOOL)validateVersion:(id *)ioValue error:(NSError **)outError;


@end
