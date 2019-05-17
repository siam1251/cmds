adb shell settings put global development_settings_enabled 1

// pushing an apk to system file
java -jar signapkonline.jar --min-sdk-version 16 rnd-signserver.huawei.com cwx567233 Jason870425! new_publickey/platform/platform.x509.pem /root/Key/huawei_apkkey_5v/platform app-china-debug.apk app-debug_signed.apk
java -jar signapkonline.jar --min-sdk-version 16 rnd-signserver.huawei.com cwx567233 Jason870425! new_publickey/platform/platform.x509.pem /root/Key/huawei_apkkey_5v/platform app-china-full-debug.apk app-debug_signed.apk
adb remount
adb push app-debug_signed.apk /system/priv-app/HwHiAiEngine/HwHiAiEngine.apk
adb reboot
pause
// ----end------

// huawei 
apt-get install libc6
apt-get install libc6

adb shell dumpsys meminfo com.huawei.videoanalysisengine>> ~/dump.txt
