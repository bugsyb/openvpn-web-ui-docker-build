#!/bin/bash -x

set -e

OD=$PWD

# go to script folder, required for below steps
CURDIR=${OD}/$(dirname $0)
cd "${CURDIR}"
# Build golang & bee environment
docker build --platform="arm64" -f Dockerfile-beego -t local/beego-v8 -t local/beego-v8:latest .

# Package OpenVPN-UI tgz
  # Patching disabled since forked
  #cd openvpn-web-ui
  #git reset --hard origin/master
  #git pull
  #cp ../openvpn-web-ui-patches/*.patch ./ -v
  #for i in *.patch; do
  #    echo "Patching: $i"
  #    patch -p1 < $i || exit 1
  #done
  #rm *.patch
  #cd $CURDIR
./openvpn-web-ui-pack2.sh

# Build OpenVPN-UI image

PKGFILE="../openvpn-web-ui/openvpn-web-ui.tar.gz"
  # Not needed since fork and additional patches applied directly
  #cp -rf openvpn-web-ui/build/assets ./
  #cp -rf assets-override/* ./assets/
cp -f $PKGFILE ./

docker build -t local/openvpn-ui .
  # Not needed since fork and additional patches not requried - hence no cleaning
  #rm -rf ./assets
rm -f $PKGFILE; rm -f $(basename $PKGFILE)
