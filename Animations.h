//
//  Animations.h
//  ObjectiveC2_Lesson1
//
//  Created by Admin on 25.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animations : NSObject

+ (void) change_CH_View:(UIView*)view Color:(UIColor*)color;
+ (void) move_Placeholder:(UILabel*)label Alpha:(int)alpha;
+ (void) move_Placeholder_UP_DOWN:(UILabel*)label Points:(int)points TextColor:(UIColor*)text_Color;
+ (void) move_Placeholder_UP_DOWN_week:(UILabel*)label Points:(int)points TextColor:(UIColor*)text_Color;
+ (void) set_Glow_Effect:(UILabel*)label Alpha:(int)alpha;

@end
