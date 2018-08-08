#!/system/bin/sh
echo      -----------------------------------------
echo      ------- Thx To :XXH3X,Spyrotecher -------
echo      ------- Kali NetHunter Installer --------
echo      -------------------v6.1------------------
echo      -----------------------------------------
sleep 5
clear
echo "##################################################"
echo "##                                              ##"
echo "##  88      a8P         db        88        88  ##"
echo "##  88    .88'         d88b       88        88  ##"
echo "##  88   88'          d8''8b      88        88  ##"
echo "##  88 d88           d8'  '8b     88        88  ##"
echo "##  8888'88.        d8YaaaaY8b    88        88  ##"
echo "##  88P   Y8b      d8''''''''8b   88        88  ##"
echo "##  88     '88.   d8'        '8b  88        88  ##"
echo "##  88       Y8b d8'          '8b 888888888 88  ##"
echo "##                                              ##"
echo "################### NetHunter ####################"
echo "################### Moded By: ####################"
echo "################### Kirimito  ####################"

# Installing Apps
pm install /app/BlueNMEA.apk
pm install /app/cSploit-release.apk
pm install /app/Drivedroid.apk
pm install /app/Hackerskeyboard.apk
pm install /app/nethunter.apk
pm install /app/OpenVPN.apk
pm install /app/RFAnalyzer.apk
pm install /app/RouterKeygen.apk
pm install /app/Shodan.apk
pm install /app/Term-nh.apk
pm install /app/USBKeyboard.apk
pm install /app/VNC-nh.apk
sleep 5

# Setting Variables
mount -o rw,remount /system
mount -o rw,remount /data
arch=$(getprop ro.product.cpu.abi)

# Choosing Right Busybox
echo "Installing Nethunter Busybox..."
rm -rf /system/xbin/busybox_nh

case $arch in
  arm64*) cp "/sdcard/install_nh/busybox/arm64/busybox" /system/xbin/busybox_nh
  ;;
  arm*) cp "/sdcard/install_nh/busybox/arm/busybox" /system/xbin/busybox_nh
esac

# Giving permissions and installing Busybox
chmod 0755 /system/xbin/busybox_nh
/system/xbin/busybox_nh --install -s /system/xbin

[ -e /system/xbin/busybox ] || {
	print "/system/xbin/busybox not found! Symlinking..."
	ln -s /system/xbin/busybox_nh /system/xbin/busybox
}

echo "Busybox Sucessfully Installed!"
sleep 2

# Clean up
echo "Cleaning up..."
rm -r /data/local/nhsystem/kali-*
sleep 2

echo "Buat Directory Chroot...!!!"
mount /system
mount /data

# Buat variable NHSYS
NHSYS=/data/local/nhsystem

# Check installer for kalifs archive
KALIFS=$(ls /sdcard/install_nh/kalifs-*.tar)
sleep 2

# MULAI Extract
echo "Mulai"
echo "Extracting Chroot...!!!"

# Extract new chroot
	print "Extracting Kali rootfs, this may take a while..."
	[ -d "$NHSYS/kali-armhf" ] && {
		print "Removing previous chroot.armhf..."
		rm -rf "$NHSYS/kali-armhf"
	}
	tar -xf "$KALIFS" -C "$NHSYS"
	print "Kali chroot installed"
        [ -d "$NHSYS/kali-amd64" ] && {
	print "@Renaming kali-amd64 to kali-armhf"
	mv -f $NHSYS/kali-amd64 $NHSYS/kali-armhf
        }

        [ -d "$NHSYS/kali-i386" ] && {
	print "@Renaming kali-i386 to kali-armhf"
	mv -f $NHSYS/kali-i386 $NHSYS/kali-armhf
        }
sleep 2
