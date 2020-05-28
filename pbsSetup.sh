#!/bin/bash
echo "deb [trusted=yes] http://download.proxmox.com/debian/pve buster pve-no-subscription" > /etc/apt/sources.list.d/pve.list
apt update
apt upgrade -y
apt install -y git clang llvm curl make makedev dpkg-dev pkg-config libssl-dev uuid acl-dev libsystemd-dev fuse3 libfuse3-dev uuid-dev udev libudev-dev libpam0g-dev libjs-extjs fonts-font-awesome libzstd1 proxmox-mini-journalreader python3-sphinx graphviz rsync perl latexmk xindy texlive-xetex texlive-fonts-recommended  fonts-open-sans

rm -rf pbsInstall
mkdir pbsInstall
cd pbsInstall

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > ./rust.sh
chmod +x ./rust.sh
./rust.sh -y
source $HOME/.cargo/env

git clone git://git.proxmox.com/git/proxmox-widget-toolkit.git
git clone git://git.proxmox.com/git/proxmox.git
git clone git://git.proxmox.com/git/proxmox-backup.git

cd proxmox-widget-toolkit

make install

cd ..

cd proxmox-backup

rm ./.cargo/config

sed -i 's/proxmox = { version/#proxmox = { version/g' ./Cargo.toml
sed -i 's/#proxmox = { path/proxmox = { path/g' ./Cargo.toml

make install
make
cp ./etc/proxmox-backup.service /lib/systemd/system/
cp ./etc/proxmox-backup-proxy.service /lib/systemd/system/

systemctl enable proxmox-backup.service 
systemctl enable proxmox-backup-proxy.service

service proxmox-backup start
service proxmox-backup-proxy start

