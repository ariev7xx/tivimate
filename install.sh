#!/data/data/com.termux/files/usr/bin/bash
if [ ! -f "tivimate.apk" ];then
echo download data..
curl -O https://raw.githubusercontent.com/ariev7xx/tivimate/main/data.zip &> /dev/null
echo mengekstrak data..
unzip -o data.zip &> /dev/null
rm data.zip &> /dev/null
fi

if ! command -v adb &> /dev/null
then
echo installing adb...
pkg update -y &> /dev/null
pkg install android-tools -y &> /dev/null
fi

adb kill-server &> /dev/null
adb devices &> /dev/null
echo masukan ip device:
read IP
adb connect $IP &> /dev/null
echo jika muncul popup fingerprint izinkan. lalu enter
read aja
adb kill-server &> /dev/null
adb devices &> /dev/null
res=$(adb connect $IP | cut -d' ' -f1)

if [ "$res" = "connected" ]; then
    echo "Connected"
    echo menguninstall tivimate lama..
    adb uninstall ar.tvplayer.tv &> /dev/null
    echo menginstall patch..
    adb install hook.apk &> /dev/null
    echo silahkan restore saat muncul popup
    adb restore ar.tvplayer.tv.ab &> /dev/null
    echo setelah restore selesai tekan enter
    read anu
    echo menyelesaikan instalasi..
    adb  install -r tivimate.apk &> /dev/null
    echo instalasi selesai
else
    echo "No connected"
    exit 1
fi