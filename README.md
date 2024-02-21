Script is from https://xdaforums.com/t/samsung-galaxy-tab-a7-lite-debloater-and-performance-booster-script.4647340/

Code to run:
& { adb push DEBLOAT-SM-T220.sh /data/local/tmp/; adb shell "cd /data/local/tmp && chmod 755 DEBLOAT-SM-T220.sh && ./DEBLOAT-SM-T220.sh" }


Change category section in script to not remove some apps. Currently removes everything except some google apps/store. 
