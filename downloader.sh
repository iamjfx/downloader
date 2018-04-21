#!/bin/bash
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get update
apt-get install -y node-js build-essential python-pip transmission-daemon cifs-utils libavahi-compat-libdnssd-dev git make g++ 

echo "Atualizando FSTAB..."
echo "."
echo "."
echo "."
echo "."
echo "//10.0.1.1/Time\040Capsule /mnt/timecapsule  cifs password=killer2,sec=ntlm,uid=1000,vers=1.0   0 0" >> /etc/fstab
mount -a

echo "instalando homebridge..."
npm install -g --unsafe-perm homebridge
npm install -g homebridge-cmdswitch2
npm install -g homebridge-wemo
cp -r homebridge/config /root/.homebridge
cp homebridge/homebridge-init /etc/init.d/homebridge
chmod +x /etc/init.d/homebridge
update-rc.d homebridge defaults

echo "instalando flexget e transmission..."
pip install flexget transmissionrpc

echo "configurando flexget e transmission..."
service transmission-daemon stop
mv /etc/transmission-daemon/settings.json /etc/transmission-daemon/settings.json_bkp
cp transmission/settings.json /etc/transmission-daemon/settings.json
gpasswd -a debian-transmission root
cp -r flexget/config /root/.flexget
service transmission-daemon start

echo "instalando pi-hole..."
curl -sSL https://install.pi-hole.net | bash
mv /etc/pihole /etc/pihole_bkp
cp -r pihole /etc/pihole
pihole -g
service pihole-FTL restart
