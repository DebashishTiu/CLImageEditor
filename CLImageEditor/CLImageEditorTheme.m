//
//  CLImageEditorTheme.m
//
//  Created by sho yakushiji on 2013/12/05.
//  Copyright (c) 2013年 CALACULU. All rights reserved.
//

#import "CLImageEditorTheme.h"

#define ColorRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0f]

#define header_color ColorRGB(19,66,142)


@implementation CLImageEditorTheme

#pragma mark - singleton pattern

static CLImageEditorTheme *_sharedInstance = nil;

+ (CLImageEditorTheme*)theme
{
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[CLImageEditorTheme alloc] init];
    });
    return _sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if (_sharedInstance == nil) {
            _sharedInstance = [super allocWithZone:zone];
            return _sharedInstance;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.bundleName                     = @"CLImageEditor";
        self.backgroundColor                = [UIColor whiteColor];
        self.toolbarColor                   = header_color;//[UIColor colorWithWhite:1 alpha:0.8];
		self.toolIconColor                  = @"white";
        self.toolbarTextColor               = [UIColor whiteColor];
        self.toolbarSelectedButtonColor     = [[UIColor cyanColor] colorWithAlphaComponent:0.2];
        self.toolbarTextFont                = [UIFont systemFontOfSize:10];
        self.statusBarHidden                = NO;
        self.statusBarStyle                 = UIStatusBarStyleDefault;
    }
    return self;
}

@end
