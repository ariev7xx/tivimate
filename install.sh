#!/data/data/com.termux/files/usr/bin/bash
while true; do
clear
echo -e "\t\t\tPilih Versi TiviMate\n\n\t1. TiviMate 2.1.5 Premium (Recommended)\n\t2. TiviMate 4.6.1 Premium\n\t3. Masukan Playlist ke TV\n\t0. Exit\n"
echo -n "Pilih : "
read x 

case $x in
3)
if ! command -v adb &> /dev/null
then
	echo installing adb...
	pkg update -y &> /dev/null
	pkg install android-tools -y &> /dev/null
fi
clear
adb devices &> /dev/null
adb kill-server &> /dev/null
echo "Masukkan IP address Target:"
echo -n ": "
read IP
adb connect $IP &> /dev/null
clear
echo "jika muncul popup fingerprint, izinkan. lalu ENTER"
read aja
adb kill-server &> /dev/null
adb devices &> /dev/null
res=$(adb connect $IP | cut -d' ' -f1)

if [ "$res" = "connected" ]; then

if adb shell dumpsys package ar.tvplayer.tv | grep -q "versionName=4.6.1"; then
echo "Device target sudah rooted ?. (y/n)"
read anu

if [ "$anu" = "y" ]; then
adb shell pm clear ar.tvplayer.tv
echo "patching tivimate.."
adb shell am start -n com.quangkv.tivimate.patch/.MainActivity &> /dev/null
adb shell input keyevent 20
adb shell input keyevent 20
adb shell input keyevent 22
adb shell input keyevent 21
adb shell input keyevent 19
adb shell input text "@apk2modsTelegramjoin-fbabc6d2-8d7a-4146-93c6-166315765887"
adb shell input keyevent 4
adb shell input keyevent 20
adb shell input keyevent 20
adb shell input keyevent 22
adb shell input keyevent 23
adb shell input keyevent 23
echo "mohon Izinkan akses root, lalu enter"
read izin
clear
fi

else
adb shell pm clear ar.tvplayer.tv
fi
	echo "Masukan playlist"
	echo -n ": "
	read nganu
	playlist="'$nganu'"


adb shell am start -n ar.tvplayer.tv/.ui.MainActivity  &> /dev/null
sleep 2
adb shell input keyevent 23
adb shell input keyevent 23
adb shell input keyevent 23
adb shell input keyevent 67
adb shell input text $playlist
adb shell input keyevent 4
adb shell input keyevent 22
adb shell input keyevent 23
else
clear
	echo "Not Connected, Please try again" 
fi
break
;;
0)
break
;;
1)
clear
if [ ! -f "TiviMate-2.1.5_Premium.apk" ];then
echo "Download TiviMate 2.1.5"
curl -O https://raw.githubusercontent.com/ariev7xx/tivimate/main/TiviMate-2.1.5_Premium.apk &> /dev/null
fi
if ! command -v adb &> /dev/null
then
	echo installing adb...
	pkg update -y &> /dev/null
	pkg install android-tools -y &> /dev/null
fi
clear
adb devices &> /dev/null
adb kill-server &> /dev/null
echo "Masukkan IP address Target:"
echo -n :
read IP
adb connect $IP &> /dev/null
clear
echo "jika muncul popup fingerprint, izinkan. lalu ENTER"
read aja
adb kill-server &> /dev/null
adb devices &> /dev/null
res=$(adb connect $IP | cut -d' ' -f1)

if [ "$res" = "connected" ]; then
	echo "Connected"
	echo menguninstall tivimate lama..
	adb uninstall ar.tvplayer.tv &> /dev/null
	echo menyelesaikan instalasi..
	adb install "TiviMate-2.1.5_Premium.apk" &> /dev/null
	echo "instalasi selesai"
	echo "Masukan playlist"
	echo -n ": "
	read nganu
	playlist="'$nganu'"

adb shell pm clear ar.tvplayer.tv
adb shell am start -n ar.tvplayer.tv/.ui.MainActivity  &> /dev/null
adb shell input keyevent 23
adb shell input keyevent 23
adb shell input text $playlist
adb shell input keyevent 4
adb shell input keyevent 22
adb shell input keyevent 23
else
clear
	echo "Not Connected, Please try again" 
fi

rm i.sh
break
;;
2)

if [ ! -d "tivimate" ];then
clear
        echo menyiapkan instalasi 
	pkg update -y &> /dev/null
        pkg install unzip -y &> /dev/null
	echo download data..
	curl -O https://raw.githubusercontent.com/ariev7xx/tivimate/main/data.zip &> /dev/null
	
 echo mengekstrak data..
 mkdir tivimate
 curl -o tivimate/patch.apk https://raw.githubusercontent.com/ariev7xx/tivimate/main/patch.apk &> /dev/null
	unzip -o -d tivimate data.zip &> /dev/null
	rm data.zip &> /dev/null
fi

if ! command -v adb &> /dev/null
then
	echo installing adb...
	pkg update -y &> /dev/null
	pkg install android-tools -y &> /dev/null
fi
clear
adb devices &> /dev/null
adb kill-server &> /dev/null
echo "Masukkan IP address Target:"
echo -n :
read IP
adb connect $IP &> /dev/null
clear
echo "jika muncul popup fingerprint, izinkan. lalu ENTER"
read aja
adb kill-server &> /dev/null
adb devices &> /dev/null
res=$(adb connect $IP | cut -d' ' -f1)

if [ "$res" = "connected" ]; then
	echo "Connected"
	echo menguninstall tivimate lama..
	adb uninstall ar.tvplayer.tv &> /dev/null
        adb uninstall com.quangkv.tivimate.patch &> /dev/null
	
clear
echo "jika muncul popup Akses root, izinkan"
echo "Device target sudah rooted ?. (y/n)"
#adb shell su -v &> /dev/null
read anu

if [ "$anu" = "y" ]; then
echo "menginstall tivimate & patcher.."
#adb shell pm clear ar.tvplayer.tv
#adb shell pm clear com.quangkv.tivimate.patch
adb install tivimate/tivimate.apk &> /dev/null
adb install tivimate/patch.apk &> /dev/null
clear
echo "patching tivimate.."
adb shell am start -n com.quangkv.tivimate.patch/.MainActivity &> /dev/null
adb shell input keyevent 20
adb shell input keyevent 20
adb shell input keyevent 22
adb shell input keyevent 21
adb shell input keyevent 19
adb shell input text "@apk2modsTelegramjoin-fbabc6d2-8d7a-4146-93c6-166315765887"
adb shell input keyevent 4
adb shell input keyevent 20
adb shell input keyevent 20
adb shell input keyevent 22
adb shell input keyevent 23
adb shell input keyevent 23
echo "mohon Izinkan akses root, lalu enter"
read izin
clear
echo "Masukan playlist"
	echo -n ": "
read nganu
playlist="'$nganu'"
adb shell am start -n ar.tvplayer.tv/.ui.MainActivity  &> /dev/null
sleep 2
adb shell input keyevent 23
adb shell input keyevent 23
adb shell input keyevent 23
adb shell input text $playlist
adb shell input keyevent 4
adb shell input keyevent 22
adb shell input keyevent 23
clear
echo done
else
        echo menginstall patch..
	adb install tivimate/hook.apk &> /dev/null
	echo silahkan restore saat muncul popup
	adb restore tivimate/ar.tvplayer.tv.ab &> /dev/null
	echo setelah restore selesai tekan enter
	read anu
	echo menyelesaikan instalasi..
	adb  install -r tivimate/tivimate.apk &> /dev/null
	echo instalasi selesai
echo "install dns66 for non-root"
adb install tivimate/dns66.apk &> /dev/null
echo done
echo "agar premium permanen, buka dns66 dulu lalu start, baru buka tivimate"
fi


else
clear
	echo "Not Connected, Please try again" 
fi

rm i.sh
break
;;
esac
done
