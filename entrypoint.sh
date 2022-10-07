#!/bin/bash
set -eux

if [ -z "$1" ]; then
    echo "Please specify package to build"
    exit 1
fi

cp -r "$1" /home/builduser

pushd /home/builduser > /dev/null
chown -R builduser:builduser "$1"

pushd "$1" > /dev/null
#su -c '. PKGBUILD && yay -S --noconfirm ${makedepends[@]} ${depends[@]}' builduser
extra-x86_64-build -- -U builduser -- --skippgpcheck
cp "$1"-*.pkg.* /github/workspace
popd > /dev/null
popd > /dev/null

PACKAGE_FILE="$(echo "$1"-*.pkg.*)"
echo ::set-output name=package-file::"$PACKAGE_FILE"
