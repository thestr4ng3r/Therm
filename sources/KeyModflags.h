//
//  KeyModflags.h
//  Therm
//
//  Created by Florian Märkl on 06.03.21.
//

#ifndef KeyModflags_h
#define KeyModflags_h

#include <AppKit/NSEvent.h>

#define NSLeftAlternateKeyMask  (0x000020 | NSAlternateKeyMask)
#define NSRightAlternateKeyMask (0x000040 | NSAlternateKeyMask)

unsigned int keyEventModifierFlags(NSEvent *event);

#endif /* KeyModflags_h */
