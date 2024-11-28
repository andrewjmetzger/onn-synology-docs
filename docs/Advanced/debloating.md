---
unlisted: true
---

# 

# ADB setup

1. Connect the Onn box to a PC and a screen.
2. Complete the initial setup "On this TV" with a dummy user account. 
3. Press the Settings button on the remote -> click (press the center button) to open Settings 
4. Enable Developer Options: Settings -> System -> About -> click "OS Build" six times, until "You are now a developer" appears.
5. Enter Settings -> System -> Developer Options -> Turn on "USB debugging".
6. Confirm the Onn is connected and visible to ADB. From the terminal, issue `adb devices`.
   Once you are connected, issue `adb reboot` to verify you can control the device and to prepare for the debloating process.

## Useful Tweaks

# Disable "Play Protect"

```shell
adb shell settings put global package_verifier_user_consent -1
```

### Use more responsive animations

```shell
adb shell settings put global window_animation_scale 0.5
adb shell settings put global transition_animation_scale 0.5
adb shell settings put global animator_duration_scale 0.5
```

### Enable AdGuard DNS to limit ads and tracking

```shell
adb shell settings put global private_dns_mode hostname
adb shell settings put global private_dns_specifier dns.adguard-dns.com
```

### Remove preinstalled applications

```shell
adb shell pm uninstall --user 0 com.amazon.amazonvideo.livingroom
adb shell pm uninstall --user 0 com.cbs.ott
adb shell pm uninstall --user 0 com.disney.disneyplus
adb shell pm uninstall --user 0 com.google.android.play.ga
adb shell pm uninstall --user 0 com.google.android.videos 
adb shell pm uninstall --user 0 com.google.android.youtube.tv 
adb shell pm uninstall --user 0 com.google.android.youtube.tvmusic 
adb shell pm uninstall --user 0 com.google.android.youtube.tvunplugged 
adb shell pm uninstall --user 0 com.hulu.livingroomplus
adb shell pm uninstall --user 0 com.netflix.ninja 
adb shell pm uninstall --user 0 com.tubitv
adb shell pm uninstall --user 0 com.wbd.stream
```

### Install FLauncher (fork)

```shell
wget "https://github.com/CocoCR300/flauncher/releases/latest/download/flauncher-armeabi-v7a-release.apk"

adb install flauncher-armeabi-v7a-release.apk

# Disable the stock launcher
adb shell pm disable-user --user 0 com.google.android.apps.tv.launcherx
adb shell pm disable-user --user 0 com.google.android.tungsten.setupwraith

# Clear data to rebuild the app list
adb shell pm clear me.efesser.flauncher
```

### Change remote buttons with KeyMapper

Keymapper is a free and open-source remapping app. Use it to replace the buttons you don't use (e.g., Netflix) with something better.

:::info[Additional requirements]
Keymapper setup requires a mouse, to set Actions. As an alternative, temporarily enable Switch Access under Settings > Accessibility.
:::

```shell
wget "https://github.com/keymapperorg/KeyMapper/releases/download/v2.6.2/keymapper-2.6.2.apk"

adb install keymapper-2.6.2.apk

# Grant permissions
adb shell pm grant io.github.sds100.keymapper android.permission.WRITE_SECURE_SETTINGS

# Enable the KeyMapper accessibility service
adb shell settings put secure enabled_accessibility_services io.github.sds100.keymapper/io.github.sds100.keymapper.service.MyAccessibilityService

# Disable energy restrictions so that KeyMapper works consistently
adb shell dumpsys deviceidle whitelist +io.github.sds100.keymapper
```

### Replace YouTube with SmartTubeNext

```shell
wget "https://github.com/yuliskov/SmartTubeNext/releases/download/latest/smarttube_stable.apk"

adb install smarttube_stable.apk
```

### Install APKUpdater to manage sideloaded app versions

```shell
wget "https://github.com/rumboalla/apkupdater/releases/latest/download/com.apkupdater-release.apk"

adb install com.apkupdater-release.apk
```