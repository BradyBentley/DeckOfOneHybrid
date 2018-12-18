//
//  BBCardController.m
//  DeckOfOneObjC
//
//  Created by Brady Bentley on 12/18/18.
//  Copyright © 2018 Brady. All rights reserved.
//

#import "BBCardController.h"
#import <UIKit/UIKit.h>

@implementation BBCardController

// MARK: - Methods
+ (void)fetchCardWithCompletion:(void (^)(BBCard *))completion
{
    //URL
    NSURL *baseUrl = [NSURL URLWithString:@"https://deckofcardsapi.com/api/deck/new/draw/?count=1"];
    NSLog(@"%@", baseUrl.absoluteString);
    //Request (if needed)
    
    //DataTask + Resume
    [[[NSURLSession sharedSession] dataTaskWithURL:baseUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        if (data == nil) {
            NSLog(@"There was an error getting the card");
            completion(nil);
            return;
        }
        NSDictionary *cardDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (cardDictionary == nil) {
            completion(nil);
            return;
        }
        BBCard *card = [[BBCard alloc] initWithDictionary:cardDictionary];
        completion(card);
    }]resume];
}

+ (void)fetchCardImageWith:(BBCard *)card completion:(void (^)(UIImage *))completion
{
    //URL
    NSURL *imageUrl = [NSURL URLWithString:[card imageUrlAsString]];
    //Request
    
    //DataTask + Resume
    [[[NSURLSession sharedSession] dataTaskWithURL:imageUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        if (data == nil) {
            NSLog(@"There was an error getting the image");
            completion(nil);
            return;
        }
        UIImage *cardImage = [[UIImage alloc] initWithData:data];
        completion(cardImage);
    }]resume];
}

@end
