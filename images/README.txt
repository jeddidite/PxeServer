Put the files from .iso's here in their own directory. 
As an example, mount an iso, then copy all the files from the iso into a folder in images:
sudo mount ubuntu.iso /mnt
sudo cp -r /mnt/. /images/ubuntu 

Then update the menus located in the below files to point to the new iso as needed:  
grub/grub.cfg
pxelinux.cfg/default
ipxe/bootuefi.ipxe
ipxe/main.ipxe 
scripts/menu.cmd

