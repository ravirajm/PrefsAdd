export GO_EASY_ON_ME = 1
export THEOS_DEVICE_IP = ron.local
include theos/makefiles/common.mk

BUNDLE_NAME = PrefsAdd
PrefsAdd_FILES = PrefsAdd.mm
PrefsAdd_INSTALL_PATH = /Library/PreferenceBundles
PrefsAdd_FRAMEWORKS = UIKit
PrefsAdd_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/PrefsAdd.plist$(ECHO_END)
