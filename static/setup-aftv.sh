
# Install AFTVNews Downloader from https://aftvnews.com/downloader.apk
curl "https://aftvnews.com/downloader.apk" --output downloader.apk
adb install ./downloader.apk

# Allow AFTVN Downloader to install apks
appops set com.esaba.downloader REQUEST_INSTALL_PACKAGES allow

# Force stop and start (with [-W]ait) to reset MainActivity
am force-stop com.esaba.downloader
am start -W -n com.esaba.downloader/.MainActivity

# Allow access to files and media
input keyevent DPAD_CENTER

# Dismiss the quick start guide modal
input keyevent DPAD_CENTER

install_code()
{
    CODE=$1
    echo "Force stop and start to reset Downloader's view"
    am force-stop com.esaba.downloader
    am start -W -n com.esaba.downloader/.MainActivity
    sleep 1

    echo Sending AFTV Short Code...
    # Click GO first to highlight the input field
    input keyevent DPAD_CENTER
    sleep 1
    # Send the short code
    input text $CODE
    # Click GO
    input keyevent KEYCODE_ENTER
}

# 889564: KeyMapper <https://github.com/keymapperorg/KeyMapper/releases/download/v2.6.2/keymapper-2.6.2.apk>
# 28544: SmartTube stable release <https://github.com/yuliskov/SmartTubeNext/releases/download/latest/smarttube_stable.apk>
# 92810: Mouse for Android TV Toggle <https://github.com/virresh/matvt/releases/tag/v1.0.6>
# 449238: Flauncher (fork) <https://github.com/CocoCR300/flauncher/releases/latest/download/flauncher-armeabi-v7a-release.apk>
# 217686: APKUpdater <https://github.com/rumboalla/apkupdater/releases/latest/download/com.apkupdater-release.apk>

CODES="964211 28544 92810 997825"

for CODE in $CODES; do
    echo "Installing $CODE, please wait..."
    install_code $CODE
done

# Leave ADB shell
exit


