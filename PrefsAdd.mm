#import <Preferences/Preferences.h>

@interface PrefsAddListController: PSListController {
	BOOL enabled;
}
@end

@implementation PrefsAddListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers=[NSArray arrayWithObjects:
     [PSSpecifier emptyGroupSpecifier],
     [PSSpecifier preferenceSpecifierNamed:@"Enabled" target:self set:@selector(toggleEnabled:) get:@selector(isEnabled) detail:nil cell:PSSwitchCell edit:nil],nil];
		 [_specifiers retain];
	}
	return _specifiers;
}
- (NSNumber *)isEnabled {
	return [NSNumber numberWithBool:enabled];
}
- (void)toggleEnabled:(NSNumber *)arg {
	PSSpecifier *spec = [PSSpecifier preferenceSpecifierNamed:@"Test" target:self set:nil get:nil detail:nil cell:PSTitleValueCell edit:nil];
	enabled = !enabled;
	if (enabled) {
        [self insertSpecifier:spec atIndex:2 animated:YES];
	} else {
		[self removeLastSpecifier];
	}
}
@end

// vim:ft=objc
