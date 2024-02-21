#!/system/bin/sh
# DEBLOAT-SM-T220 Script for Samsung Galaxy Tab A7 Lite
# Original by doggydog2, Enhanced by iPollesion, 12/23/2023
# Source: www.xda-developers.com
# Tested on SM-T220, Android 13, One UI Core 5.1.1, Build TP1A.220624.014.T220XXS5CWK1
#
# Instructions:
# 1. Enable USB Debugging on your device.
# 2. Connect the device to your PC.
# 3. Open Command Prompt where ADB is installed.
# 4. Execute the following command:
#    & { adb push DEBLOAT-SM-T220.sh /data/local/tmp/; adb shell "cd /data/local/tmp && chmod 755 DEBLOAT-SM-T220.sh && ./DEBLOAT-SM-T220.sh" }
#
# This script modifies system packages and settings.

clear
echo '
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⠿⠿⣶⣦⣤⣀⠀⠀⠀⠀   *. dfa .*⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣗⡒⠦⠌⢽⠿⣝⢦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣯⣿⣘⣿⡘⢧⢹⡄⠀⠀⣤⣤⣿⠛⡿⠛⠳⣄⣄⠀⣀⣤⣤⣴⣶⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⡖⠾⢿⢸⣤⡇⢠⡶⠿⠐⠛⠀⠀⠀⠀⠉⢩⣏⡥⠶⢛⣛⣿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣟⡒⣾⣇⣧⣸⠗⠀⠀⡀⠠⣄⣰⡷⣆⠈⡹⢧⡩⣭⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⣤⡿⠛⠿⣾⣴⣶⠻⢦⡽⠋⠀⠈⢳⡶⢾⡷⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠋⠀⠀⢀⣻⣏⢿⣳⠛⣦⣄⣀⣀⣼⠗⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡟⠀⠀⠀⢠⠏⠉⠛⠳⢦⣄⠈⢹⣹⡟⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠐⠶⢾⣄⠀⠀⠀⠀⠙⠓⠲⠿⣿⣶⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡀⠀⠀⠀⠀⠈⠙⠳⣶⣶⣦⣤⣴⣾⣿⣿⣿⣿⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠟⣩⠙⠓⠦⣄⣀⣀⡀⠀⠀⠈⠉⠀⠈⢻⣿⢿⣿⣿⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠞⢡⢰⡏⠀⠀⠀⠀⠀⠉⠉⠉⣹⣷⣤⣄⣼⠿⣿⣧⣽⠿⣿⣿⣿⣿⠿⣿⠶⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠁⠀⠀⢸⠘⠃⠀⠀⠀⣤⡄⠀⠀⠀⢈⣿⠿⠻⣧⣀⡈⠉⢉⣿⣿⣿⣿⣯⣦⡈⠳⢄⡙⢦⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣠⡀⠀⠀⠀⠀⠀⢀⡾⠁⠀⠀⠀⠀⠘⡆⠀⠀⠀⠀⠈⠀⠀⠀⣠⡾⠃⠀⠀⠀⠈⠉⠙⣿⣿⣿⣿⠿⠿⠛⠻⢦⣀⠉⣾⣿⣦⣀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣠⠖⠋⠀⠻⣤⣀⣀⠀⢠⡟⠀⠀⠀⠀⠀⠀⣸⣡⢀⣤⡤⠤⠖⢲⡶⠞⠉⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⡇⠀⠀⠀⠀⠀⠈⠛⠛⠿⣿⣿⣧⠀⠀⠀⠀
⠀⠀⠠⣾⣉⣅⣀⡤⢤⣤⣤⡴⠿⢿⠿⠀⠀⠀⠀⠀⢀⣼⠋⠙⠛⠀⣀⡴⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⣦⣀⣴⡾
⠀⠀⠀⠀⠀⠀⠀⢀⡤⠛⠁⠀⠀⠋⠀⠀⠀⠀⢀⣾⠟⠁⠀⢀⣠⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠟⠀
⠀⣀⣤⠖⠛⠉⠉⠉⠀⠀⠀⠀⠀⠀⠴⣶⡶⠴⠿⠿⠶⠶⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢸⣟⠁⠀⠀⠀⣰⡦⠴⠒⠒⠒⠛⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢸⠇⣠⠤⠒⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠈⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀subculturenetworks.com⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
'
sleep 5  # Wait 5 seconds

# Check if a package exists
package_exists() {
    package_name=$1
    pm list packages | grep -w "^package:$package_name$" > /dev/null
    return $?
}

# Function to disable or enable a package
manage_package() {
    action=$1
    package=$2

    if package_exists $package; then
        current_state=$(pm list packages -d | grep -w "$package")
        if [ "$action" = "disable" ]; then
            if [ -z "$current_state" ]; then
                pm disable-user --user 0 $package
                echo "$package: DISABLED" >> /sdcard/Download/DEBLOAT_LOG.txt
            else
                echo "$package: ALREADY DISABLED" >> /sdcard/Download/DEBLOAT_LOG.txt
            fi
        elif [ "$action" = "enable" ]; then
            if [ ! -z "$current_state" ]; then
                pm enable $package
                echo "$package: ENABLED" >> /sdcard/Download/DEBLOAT_LOG.txt
            else
                echo "$package: ALREADY ENABLED" >> /sdcard/Download/DEBLOAT_LOG.txt
            fi
        fi
    else
        echo "$package: PACKAGE NOT FOUND" >> /sdcard/Download/DEBLOAT_LOG.txt
    fi
}

# Set categories (0-skip, 1-do, 2-undo)
safetodisable=1
bixby=1
game=1
accounts=1
basic=1
tricky=1
google=2
vendors=1
backdoors=1
more=1
dns=1


# Define packages for each category
# Define packages for the 'safetodisable_packages' category
safetodisable_packages=(
    "com.samsung.bbc.bbcagent"
    "com.sec.android.app.chromecustomizations"
    "com.android.sharedstoragebackup"
    "com.android.wallpapercropper"
    "com.sec.factory"
    "com.sec.epdgtestapp"
    "com.facebook.system"
    "com.facebook.appmanager"
    "com.sec.android.widgetapp.easymodecontactswidget"
    "com.samsung.android.app.galaxyfinder"
    "com.sec.android.app.samsungapps"
    "com.android.wallpaper.livepicker"
    "com.sec.android.app.magnifier"
    "com.android.mms.service"
    "com.samsung.android.allshare.service.mediashare"
    "com.sec.android.mimage.photoretouching"
    "com.android.dreams.phototable"
    "com.samsung.safetyinformation"
    "com.sec.android.app.billing"
    "com.sec.android.app.SecSetupWizard"
    "com.sec.hearingadjust"
    "com.samsung.android.service.aircommand"
    "com.google.android.projection.gearhead"
    "com.android.egg"
    "com.google.android.as"
    "com.samsung.android.appsedge"
    "com.samsung.android.ardrawing"
    "com.samsung.android.aremoji"
    "com.samsung.android.aremojieditor"
    "com.sec.android.mimage.avatarstickers"
    "com.samsung.android.arzone"
    "com.sec.provides.assisteddialing"
    "com.sec.mhs.smarttethering"
    "com.sec.android.autodoodle.service"
    "com.samsung.android.samsungpassautofill"
    "com.sec.android.app.DataCreate"
    "com.android.dreams.basic"
    "com.android.bookmarksprovider"
    "com.android.providers.calendar"
    "com.samsung.android.mdeservice"
    "com.samsung.android.app.clipboardedge"
    "com.samsung.android.app.camera.sticker.facearavatar.preload"
    "com.samsung.android.livestickers"
    "com.sec.factoryapp"
    "com.sec.android.app.dexonpc"
    "com.diotek.sec.lookup.dictionary"
    "com.samsung.android.da.daagent"
    "com.samsung.android.bluelightfilter"
    "com.facebook.services"
    "com.samsung.faceservice"
    "com.samsung.storyservice"
    "com.android.hotwordenrollment.xgoogle"
    "com.android.hotwordenrollment.okgoogle"
    "com.samsung.android.mobileservice"
    "com.samsung.android.sdk.hardwriting"
    "com.samsung.android.service.health"
    "com.hiya.star"
    "com.samsung.android.knox.pushmananger"
    "com.samsung.android.knox.kpecore"
    "com.samsung.android.app.simplesharing"
    "com.samsung.android.mdx.quickboard"
    "com.samsung.android.service.peoplestripe"
    "com.samsung.android.app.dofviewer"
    "com.samsung.android.privateshare"
    "com.samsung.android.aware.service"
    "com.samsung.android.app.sharelive"
    "com.samsung.android.app.omcagent"
    "com.samsung.android.app.reminder"
    "com.samsung.android.coldwalletservice"
    "com.sec.android.app.ve.vebgm"
    "com.samsung.android.kidsinstaller"
    "com.sec.location.nsflp2"
    "com.samsung.android.samsunpass"
    "com.samsung.android.dkey"
    "com.samsung.android.carkey"
    "com.samsung.android.ipsgeofence"
    "com.samsung.android.svoiceime"
    "com.samsung.android.service.tagservice"
    "com.android.apps.tag"
    "com.samsung.android.accessibility.talkback"
    "com.samsung.android.app.taskedge"
    "com.sec.android.app.quicktool"
    "com.samsung.android.service.airviewdictionary"
    "com.samsung.android.vtcamerasettings"
    "com.samsung.android.net.wifi.wifiguider"
    "com.samsung.android.knox.containeragent"
    "com.android.managedprovisioning"
    "com.microsoft.appmanager"
    "com.samsung.android.dialer"
    "com.samsung.android.galaxycontinuity"
    "com.samsung.android.app.contacts"
    "com.sec.android.app.myfiles"
    "com.samsung.android.forest"
)

bixby_packages=(
    "com.samsung.android.app.spage"
    "com.samsung.android.app.settings.bixby"
    "com.samsung.android.bixby.agent"
    "com.samsung.android.bixbyvision.framework"
    "com.samsung.android.bixby.wakeup"
    "com.samsung.android.bixby.service"
    "com.samsung.android.bixby.agent.dummy"
    "com.samsung.systemui.bixby2"
    "com.samsung.android.bixby.plmsync"
    "com.samsung.android.app.routines"
    "com.samsung.android.visionintelligence"
    "com.samsung.visionprovider"
)

game_packages=(
    "com.samsung.android.game.gamehome"
    "com.enhance.gameservice"
    "com.samsung.android.game.gametools"
    "com.samsung.android.game.gos"
)

accounts_packages=(
    "com.osp.app.signin"
    "com.samsung.android.voc"
    "com.samsung.android.scloud"
    "com.sec.spp.push"
    "com.samsung.android.fmm"
    "com.samsung.android.rubin.app"
    "com.samsung.android.mdecservice"
)

basic_packages=(
    "com.sec.android.daemonapp"
    "com.samsung.android.wellbeing"
    "com.samsung.android.service.livedrawing"
    "com.sec.android.app.sbrowser"
    "com.samsung.SMT"
    "com.samsung.android.beaconmanager"
    "com.samsung.android.app.watchmanagerstub"
    "com.sec.android.easyMover"
    "com.sec.android.easyMover.Agent"
    "com.samsung.android.smartswitchassistant"
    "com.samsung.crane"
    "com.android.providers.partnerbookmarks"
    "com.samsung.android.calendar"
    "com.samsung.android.messaging"
    "com.samsung.android.securitylogagent"
    "com.samsung.android.location"
)

tricky_packages=(
    "com.knox.vpn.proxyhandler"
    "com.samsung.android.knox.containercore"
    "com.samsung.knox.keychain"
    "com.sec.enterprise.knox.cloudmdm.smdms"
    "com.samsung.android.knox.analytics.uploader"
    "com.samsung.klmsagent"
    "com.samsung.android.knox.attestation"
    "com.sec.android.diagmonagent"
    "com.samsung.sec.android.application.csc"
    "com.samsung.android.dqagent"
    "com.samsung.aasaservice"
    "com.samsung.android.bbc.bbcagent"
    "com.samsung.cmh"
    "com.samsung.android.fast"
    "com.samsung.android.sm.devicesecurity"
    "com.sec.phone"
    "com.sec.bcservice"
)

vendors_packages=(
    "com.microsoft.skydrive"
    "com.microsoft.office.outlook"
    "com.microsoft.office.officehubrow"
    "com.microsoft.office.excel"
    "com.microsoft.office.word"
    "com.microsoft.office.powerpoint"
    "com.netflix.partner.activation"
    "com.netflix.mediaclient"
    "com.spotify.music"
)

google_packages=(
    "com.google.android.syncadapters.calendar"
    "com.google.android.syncadapters.contacts"
    "com.google.android.apps.restore"
    "com.google.android.setupwizard"
    "com.google.android.partnersetup"
    "com.google.android.onetimeinitializer"
    "com.google.android.googlequicksearchbox"
    "com.google.android.tts"
    "com.android.printspooler"
    "com.google.android.printservice.recommendation"
    "com.google.android.feedback"
    "com.google.android.gm"
    "com.google.android.gms.location.history"
    "com.google.android.apps.tachyon"
    "com.google.android.apps.turbo"
    "com.android.chrome"
    "com.google.mainline.telemetry"
    "com.google.android.apps.photos"
    "com.google.android.youtube"
    "com.google.android.apps.youtube.music"
    "com.google.android.videos"
    "com.android.vending"
    "com.google.android.apps.maps"
)

log_file="/sdcard/Download/DEBLOAT_LOG.txt"

echo ""
echo "=============================================="
echo "                Cleanup Log"
echo "=============================================="
echo ""

# Handling safetodisable_packages
if [[ $safetodisable == 1 ]]; then
    echo Removing safetodisable_packages
    for package in "${safetodisable_packages[@]}"; do
        manage_package "disable" "$package"
    done
elif [[ $safetodisable == 2 ]]; then
    echo Reverting safetodisable_packages
    for package in "${safetodisable_packages[@]}"; do
        manage_package "enable" "$package"
    done
fi

# Handling categories
if [[ $bixby == 1 ]]; then
    echo Removing bixby
    for package in "${bixby_packages[@]}"; do
        manage_package "disable" "$package"
    done
elif [[ $bixby == 2 ]]; then
    echo Reverting bixby
    for package in "${bixby_packages[@]}"; do
        manage_package "enable" "$package"
    done
fi

if [[ $game == 1 ]]; then
    echo Removing game
    for package in "${game_packages[@]}"; do
        manage_package "disable" "$package"
    done
elif [[ $game == 2 ]]; then
    echo Reverting game
    for package in "${game_packages[@]}"; do
        manage_package "enable" "$package"
    done
fi

if [[ $accounts == 1 ]]; then
    echo Removing accounts
    for package in "${accounts_packages[@]}"; do
        manage_package "disable" "$package"
    done
elif [[ $accounts == 2 ]]; then
    echo Reverting accounts
    for package in "${accounts_packages[@]}"; do
        manage_package "enable" "$package"
    done
fi

if [[ $basic == 1 ]]; then
    echo Removing basic
    for package in "${basic_packages[@]}"; do
        manage_package "disable" "$package"
    done
elif [[ $basic == 2 ]]; then
    echo Reverting basic
    for package in "${basic_packages[@]}"; do
        manage_package "enable" "$package"
    done
fi

if [[ $tricky == 1 ]]; then
    echo Removing tricky
    for package in "${tricky_packages[@]}"; do
        manage_package "disable" "$package"
    done
elif [[ $tricky == 2 ]]; then
    echo Reverting tricky
    for package in "${tricky_packages[@]}"; do
        manage_package "enable" "$package"
    done
fi

if [[ $google == 1 ]]; then
    echo Removing google
    for package in "${google_packages[@]}"; do
        manage_package "disable" "$package"
    done
elif [[ $google == 2 ]]; then
    echo Reverting google
    for package in "${google_packages[@]}"; do
        manage_package "enable" "$package"
    done
fi

# These will uninstall, you can move the packages to the vendors_packages category if you'd prefer to uninstall them
if [[ $vendors == 1 ]]; then
    echo Removing vendors
    for package in "${vendors_packages[@]}"; do
        if pm list packages | grep -qw "^package:$package$"; then
            echo "Uninstalling $package"
            if pm uninstall --user 0 "$package"; then
                echo "$package: UNINSTALLED SUCCESSFULLY" >> /sdcard/Download/DEBLOAT_LOG.txt
            else
                echo "$package: FAILED TO UNINSTALL" >> /sdcard/Download/DEBLOAT_LOG.txt
            fi
        else
            echo "$package: PACKAGE NOT FOUND" >> /sdcard/Download/DEBLOAT_LOG.txt
        fi
    done
elif [[ $vendors == 2 ]]; then
    echo Reverting vendors
    # Reinstall your bloat manually
fi

if [[ $backdoors == 1 ]]; then
    echo Removing backdoors
    pm revoke --user 11 com.android.vending android.permission.PACKAGE_USAGE_STATS
    pm revoke --user 11 com.google.android.gms android.permission.PACKAGE_USAGE_STATS
    pm revoke --user 11 com.google.android.googlequicksearchbox android.permission.PACKAGE_USAGE_STATS
elif [[ $backdoors == 2 ]]; then
    echo Reverting backdoors
    pm grant --user 11 com.android.vending android.permission.PACKAGE_USAGE_STATS
    pm grant --user 11 com.google.android.gms android.permission.PACKAGE_USAGE_STATS
    pm grant --user 11 com.google.android.googlequicksearchbox android.permission.PACKAGE_USAGE_STATS
fi

if [[ $dns == 1 ]]; then
    echo Fixing DNS
    [ "$(getprop net.dns2)" = "8.8.8.8" ] && setprop net.dns2 ""
elif [[ $dns == 2 ]]; then
    echo Reverting DNS
    # Just reboot
fi

echo ""
echo "=============================================="
echo "             Execution Complete"
echo "=============================================="
echo ""

echo "Check the log on your device for more details."
echo "/sdcard/Download/DEBLOAT_LOG.txt"
echo ""
