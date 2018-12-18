//
//  BBCard.h
//  DeckOfOneObjC
//
//  Created by Brady Bentley on 12/18/18.
//  Copyright © 2018 Brady. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBCard : NSObject

// MARK: - Properties
@property (nonatomic, readonly) NSString *imageUrlAsString;

// MARK: - Initialization
- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
