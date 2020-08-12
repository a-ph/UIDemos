//
//  UIColor+UL.m
//  UXLive
//
//  Created by leo.li on 16/6/30.
//  Copyright © 2016年 UXIN CO. All rights reserved.
//

#import "UIColor+UL.h"

@implementation UIColor (UL)

+ (UIColor *)colorWithHexString:(NSString *)hexString4Color {
    if (![hexString4Color isKindOfClass:[NSString class]] || [hexString4Color length] == 0) {
        return [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
    }

    const char *s = [hexString4Color cStringUsingEncoding:NSASCIIStringEncoding];
    if (s != NULL) {
        if (*s == '#') {
            ++s;
        }
        unsigned long long value = strtoll(s, nil, 16);
        int r, g, b, a;
        switch (strlen(s)) {
            case 2:
                // xx
                r = g = b = (int)value;
                a = 255;
                break;
            case 3:
                // RGB
                r = ((value & 0xf00) >> 8);
                g = ((value & 0x0f0) >> 4);
                b = ((value & 0x00f) >> 0);
                r = r * 16 + r;
                g = g * 16 + g;
                b = b * 16 + b;
                a = 255;
                break;
            case 6:
                // RRGGBB
                r = (value & 0xff0000) >> 16;
                g = (value & 0x00ff00) >>  8;
                b = (value & 0x0000ff) >>  0;
                a = 255;
                break;
            default:
                // RRGGBBAA
                r = (value & 0xff000000) >> 24;
                g = (value & 0x00ff0000) >> 16;
                b = (value & 0x0000ff00) >>  8;
                a = (value & 0x000000ff) >>  0;
                break;
        }
        return [UIColor colorWithRed:r / 255.0f
                               green:g / 255.0f
                                blue:b / 255.0f
                               alpha:a / 255.0f];
    }
    return [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString4Color alpha:(CGFloat)alpha {
    return [[self colorWithHexString:hexString4Color] colorWithAlphaComponent:alpha];
}

- (BOOL)isEqualWithColor:(UIColor *)color {
    if ([color respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        CGFloat r1;
        CGFloat g1;
        CGFloat b1;
        CGFloat a1;
        [self getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
        CGFloat r2;
        CGFloat g2;
        CGFloat b2;
        CGFloat a2;
        [color getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
        if (r1 == r2 && g1 == g2 && b1 == b2 && a1 == a2) {
            return YES;
        }
    }
    return NO;
}

@end
