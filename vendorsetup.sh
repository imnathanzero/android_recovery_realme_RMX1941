#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="RMX1941"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export ALLOW_MISSING_DEPENDENCIES=true
	export OF_ADVANCED_SECURITY=1
	export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
	export FOX_USE_BASH_SHELL=1
	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export FOX_USE_UNZIP_BINARY=1
	export FOX_USE_ZIP_BINARY=1
        export FOX_DEVICE_MODEL=RMX1941
	export OF_FLASHLIGHT_ENABLE=1
        export OF_FIX_DECRYPTION_ON_DATA_MEDIA=1
	export FOX_USE_DATA_RECOVERY_FOR_SETTINGS=1
        export OF_ENABLE_LAB=1
        export OF_HIDE_NOTCH=1
	export OF_STATUS_INDENT_LEFT=50
        export OF_STATUS_INDENT_RIGHT=50
	export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export OF_FL_PATH1="/sys/class/leds/flashlight"
	export OF_KEEP_FORCED_ENCRYPTION=1
	export OF_MAINTAINER="nathan"
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_PATCH_AVB20=1
	export OF_QUICK_BACKUP_LIST="/boot;/data;/system;/vendor;"
	export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=0
	export OF_SUPPORT_OZIP_DECRYPTION=1
	export FOX_TARGET_DEVICES="RMX1941,RMX1945,realmec2"
	export OF_USE_MAGISKBOOT=1
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export OF_USE_TWRP_SAR_DETECT=1
	export PLATFORM_SECURITY_PATCH="2099-12-31"
	export PLATFORM_VERSION="99.87.36"
	export TARGET_DEVICE_ALT="RMX1941,RMX1945,realmec2"
	export TW_DEFAULT_LANGUAGE="en"
	export OF_SCREEN_H=2340
	export OF_STATUS_H=76
 export OF_USE_LZMA_COMPRESSION=1
	export FOX_DRASTIC_SIZE_REDUCTION=1
	
# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
#
