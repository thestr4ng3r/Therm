//
//  KeyModflags.m
//  Therm
//
//  Created by Florian Märkl on 06.03.21.
//

#import "KeyModflags.h"
#import <Carbon/Carbon.h>

// dirty workaround for https://gitlab.com/gnachman/iterm2/-/issues/6549
// flip left/right alt for internal keyboard
unsigned int keyEventModifierFlags(NSEvent *event) {
    unsigned int modflag = (unsigned int)[event modifierFlags];
    if ((modflag & NSAlternateKeyMask) == NSAlternateKeyMask) {
        EventRef eventRef = (EventRef)[event eventRef];
        if (eventRef) {
            unsigned kbt;
            GetEventParameter(eventRef, kEventParamKeyboardType, typeUInt32, NULL, sizeof(kbt), NULL, &kbt);
            if (kbt == 92) { // observation-based
                BOOL right = (modflag & NSRightAlternateKeyMask) == NSRightAlternateKeyMask;
                BOOL left = (modflag & NSLeftAlternateKeyMask) == NSLeftAlternateKeyMask;
                modflag = modflag & ~(NSRightAlternateKeyMask | NSLeftAlternateKeyMask);
                if (left) {
                    modflag = modflag | NSRightAlternateKeyMask;
                }
                if (right) {
                    modflag = modflag | NSLeftAlternateKeyMask;
                }
            }
        }
    }
    return modflag;
}
