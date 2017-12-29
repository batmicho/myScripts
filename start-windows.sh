#!/bin/bash

cd ~/QEMU/

qemu-system-x86_64 -m 4096 -enable-kvm -drive file=win7.img,format=raw -cpu host -smp cores=4 -vga virtio &

