#!/usr/bin/bash

if [ $UID -ne 0 ]
then
	echo "Please run as root"
	exit 1
fi

read -p "Which disk to write NyanCat? " DISK
read -p "Are you sure?[Y/N] " YESNO

if [ $YESNO = "Y" ]
then
    dd if=nyn_mbr.bin of="$DISK" bs=512 count=1
    dd if=nyn_main.bin of="$DISK" bs=512 seek=1 count=4
else
    echo "Nothing to do"
fi