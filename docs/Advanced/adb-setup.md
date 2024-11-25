---
unlisted: true
---

# ADB setup

1. Connect the Onn box to a PC and a screen
  
2. Complete the OOBE "On this TV" with a dummy user account. 
  
3. Press the Settings button on the remote -> click (press the center button) to open Settings 

4. Enable Developer Options: Settings -> System -> About -> click "OS Build" six times, until "You are now a developer" appears.

5. Enter Settings -> System -> Developer Options -> Turn on "USB debugging" and connect                    

----

## Useful Tweaks

### Disable Stock Launcher
```
adb shell pm disable-user --user 0 com.google.android.apps.tv.launcherx
adb shell pm disable-user --user 0 com.google.android.tungsten.setupwraith
```


### Enable AdGuard DNS
```
adb shell settings put global private_dns_mode hostname
adb shell settings put global private_dns_specifier dns.adguard.com
```

### Double-speed Responsive Animations
```
adb shell settings put global window_animation_scale 0.5
adb shell settings put global transition_animation_scale 0.5
adb shell settings put global animator_duration_scale 0.5
```
