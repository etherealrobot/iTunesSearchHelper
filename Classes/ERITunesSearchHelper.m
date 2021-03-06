//
//  ERITunesSearchHelper.m
//  iTunesSearchHelper
//
//  Created by Don on 9/2/10.
//  Copyright (c) 2010 Ethereal Robot, LLC. 
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

//  cf. http://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html

#import "ERITunesSearchHelper.h"
#import "ERITunesSearchQuery.h"
#import "ERITunesSearchResult.h"


static NSString * const kERISHSearchAddress = @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/wa/wsSearch?";

@implementation ERITunesSearchHelper

@synthesize delegate, affiliateId;


- (void)searchWithQuery:(ERITunesSearchQuery *) query;
{
	//
}

@end
