//
//  BBCard.m
//  DeckOfOneObjC
//
//  Created by Brady Bentley on 12/18/18.
//  Copyright © 2018 Brady. All rights reserved.
//

#import "BBCard.h"

@implementation BBCard

// MARK: - Initialization
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        NSArray *cards = dictionary[@"cards"];
        NSDictionary *cardDictionary = [cards firstObject];
        NSString *imageUrlAsString = cardDictionary[@"images"];
        _imageUrlAsString = imageUrlAsString;
    }
    return self;
}

@end
