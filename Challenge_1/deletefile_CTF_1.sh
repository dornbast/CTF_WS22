#!/bin/bash
# ------------------------------------------------------------------------------------------------------------ # 
# 					--- Delete FILE ---						       #
# ------------------------------------------------------------------------------------------------------------ # 
sudo umount /dev/loop0p1
sudo losetup --detach /dev/loop0 
sudo rm -r /home/ctf-admin/Desktop/CTF_Challenges/Challenge_1/CTF_Challenge_1.raw
sudo rm -r /mnt/CTF
