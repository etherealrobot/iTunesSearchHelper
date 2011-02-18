//
//  ERITunesSearchErrors.h
//  iTunesSearchHelper
//
//  Created by Don on 10/19/10.
//  Copyright 2010 Ethereal Robot, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
	ERITunesSearchLimitError = 1,
	ERITunesSearchLangError = 2,
	ERITunesSearchVersionError = 4,
	ERITunesSearchMediaError = 8,
	ERITunesSearchMediaEntityError = 16,
	ERITunesSearchMediaAttributeError = 32
};
