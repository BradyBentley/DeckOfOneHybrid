//
//  BBCardController.h
//  DeckOfOneObjC
//
//  Created by Brady Bentley on 12/18/18.
//  Copyright © 2018 Brady. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBCard.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBCardController : NSObject

// MARK: - Methods
+ (void) fetchCardWithCompletion: (void (^) (BBCard * _Nullable))completion;

+ (void) fetchCardImageWith: (BBCard * _Nullable)card
                 completion: (void (^) (UIImage *))completion;


@end

NS_ASSUME_NONNULL_END
