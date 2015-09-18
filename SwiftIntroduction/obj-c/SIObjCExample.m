//
//  SIObjCExample.m
//  SwiftIntroduction
//
//  Created by iOS Developer on 9/18/15.
//  Copyright © 2015 Applikey Solutions. All rights reserved.
//

#import "SIObjCExample.h"
#import "SwiftIntroduction-Swift.h" //!

@implementation SIObjCExample

+ (SIHero *)testSwiftCall {
    SIPropertiesAndSubscriptsExample *demo = [[SIPropertiesAndSubscriptsExample alloc] init];
    return [demo heroAtIndex:1];
}

@end
