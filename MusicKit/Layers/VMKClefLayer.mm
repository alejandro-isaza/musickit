//  Copyright (c) 2014 Venture Media Labs. All rights reserved.

#import "VMKClefLayer.h"


using namespace mxml;

@implementation VMKClefLayer

+ (NSString*)imageNameForSign:(dom::Clef::Sign)sign {
    switch (sign) {
        case dom::Clef::Sign::G: return @"treble-clef";
        case dom::Clef::Sign::F: return @"bass-clef";
        default: return nil;
    }
}

- (instancetype)initWithClefGeometry:(const ClefGeometry*)clefGeom {
    return [super initWithGeometry:clefGeom];
}

- (const ClefGeometry*)clefGeometry {
    return static_cast<const ClefGeometry*>(self.geometry);
}

- (void)setClefGeometry:(const mxml::ClefGeometry *)clefGeometry {
    [self setGeometry:clefGeometry];
}

- (void)setGeometry:(const Geometry*)geometry {
    [super setGeometry:geometry];

    if (geometry) {
        const dom::Clef& clef = self.clefGeometry->clef();
        self.imageName = [[self class] imageNameForSign:clef.sign()];
    } else {
        self.imageName = nil;
    }
}

@end
