#!/bin/bash -e

echo "Waiting for emulator..."

android-wait-for-emulator

echo "Dismissing potential ANR's"
adb shell dumpsys window windows | grep -i mCurrentFocus
if [[ `adb shell dumpsys window windows | grep -i mCurrentFocus | grep -i "not resp"` ]]; then
    adb shell input keyevent KEYCODE_DPAD_DOWN
    adb shell input keyevent KEYCODE_DPAD_DOWN
    adb shell input keyevent KEYCODE_ENTER
fi
