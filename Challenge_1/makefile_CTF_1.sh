#!/bin/bash
# ------------------------------------------------------------------------------------------------------------ # 
# 					--- MAKE FILE ---						       #
# ------------------------------------------------------------------------------------------------------------ # 

# Mit Nullen gefülltes File erstellen - 32Byte 
sudo dd if=/dev/zero of=/home/ctf-admin/Desktop/CTF_Challenges/Challenge_1/CTF_Challenge_1.raw bs=1MiB count=32 conv=notrunc

# File dem Loop-Device zuweisen:
sudo losetup /dev/loop0 /home/ctf-admin/Desktop/CTF_Challenges/Challenge_1/CTF_Challenge_1.raw

# File Label, Partition und Dateisystem erstellen:
sudo parted -s /dev/loop0 mklabel gpt
sudo parted -s /dev/loop0 mkpart primary ext3 1MiB 100%
sudo mkfs --type ext3 /dev/loop0p1

# Loop-Device mounten 
sudo mkdir /mnt/CTF
sudo mount /dev/loop0p1 /mnt/CTF/

# Ordnerstruktur generieren
sudo mkdir /mnt/CTF/home
sudo mkdir /mnt/CTF/home/newuser
sudo mkdir /mnt/CTF/home/newuser/Desktop
sudo mkdir /mnt/CTF/home/newuser/Documents
sudo touch /mnt/CTF/home/newuser/Documents/hidden.txt
sudo echo nothing to see here :D > /mnt/CTF/home/newuser/Documents/hidden.txt
sudo touch /mnt/CTF/home/newuser/Documents/donttouchme.txt
sudo echo nothing to see here :D > /mnt/CTF/home/newuser/Documents/donttouchme.txt
sudo mkdir /mnt/CTF/home/newuser/Downloads
sudo mkdir /mnt/CTF/home/newuser/Musik
sudo touch /mnt/CTF/home/newuser/Musik/hearme.mp3
sudo mkdir /mnt/CTF/home/newuser/Public
sudo mkdir /mnt/CTF/home/newuser/Pictures
sudo mkdir /mnt/CTF/home/newuser/Videos 
sudo mkdir /mnt/CTF/home/newuser/Templates
sudo mkdir /mnt/CTF/var
sudo mkdir /mnt/CTF/usr
sudo mkdir /mnt/CTF/tmp
sudo mkdir /mnt/CTF/sys
sudo mkdir /mnt/CTF/srv
sudo mkdir /mnt/CTF/sbin
sudo mkdir /mnt/CTF/run
sudo mkdir /mnt/CTF/root
sudo mkdir /mnt/CTF/proc
sudo mkdir /mnt/CTF/opt
sudo mkdir /mnt/CTF/mnt
sudo mkdir /mnt/CTF/lib
sudo mkdir /mnt/CTF/etc
sudo mkdir /mnt/CTF/dev
sudo mkdir /mnt/CTF/boot
sudo mkdir /mnt/CTF/bin

# ------------------------------------------------------------------------------------------------------------ # 
# 					--- Challenge 1 ---						       #
# ------------------------------------------------------------------------------------------------------------ # 
# CTF{Level1} als HEX-Value auf Disk schreiben 
printf '\x43\x54\x46\x7B\x4C\x65\x76\x65\x6C\x31\x7D' | sudo dd of=/dev/loop0 bs=1 seek=464 count=11 conv=notrunc

