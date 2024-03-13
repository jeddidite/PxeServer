# PxeServer
Prerequisites:
1. Install Dependencies:
  sudo apt update && sudo apt upgrade
  sudo apt install apache2
  sudo apt install samba 
  sudo apt install isc-dhcp-server
  sudo apt install tftp-server 
  sudo apt install syslinux 
  sudo apt install net-tools
  sudo apt install nfs-kernel-server
  sudo mkdir /var/server  
  sudo reboot

3. Move over configuration files in "support_files" to their proper places.
  sudo mv /var/server/support_files/apache2.conf /etc/apache2/apache2.conf
  sudo mv /var/server/support_files/dhcpd.conf /etc/dhcp/dhcpd.conf
  sudo mv /var/server/support_files/smb.conf /etc/samba/smb.conf
  sudo mv /var/server/support_files/tftpd-hpa /etc/default/tftpd-hpasudo
  sudo mv /var/server/support_files/nfs-kernel-server /etc/default/nfs-kernel-server

5. Set proper IP address of server
  sudo ifconfig eth0 down
  sudo ifconfig eth0 192.168.0.1
  sudo ifconfig eth0 up

6. Allow proper ports in firewall
   sudo ufw allow apache
   sudo ufw allow samba
   sudo ufw allow dhcp
   sudo ufw allow tftp
   sudo ufw allow nfs

7. Restart services
  sudo systemctl restart isc-dhcp-server
  sudo systemctl restart tftpd-hpa.service 
  sudo systemctl restart apache2.service 
  sudo systemctl restart smbd.service 
  sudo systemctl restart nfs-server.service 
  sudo systemctl restart nfs-mountd.service 
