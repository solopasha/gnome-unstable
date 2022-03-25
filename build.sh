#!/usr/bin/env bash
set -euxo pipefail
repo=$1

if [[ -z "$repo" ]]; then
  echo "Usage: ./build <repo>"
  exit
fi

build() {
  pushd $1
  shift
  sudo makechrootpkg -r /var/lib/archbuild/${repo}-x86_64/ -- -r $@
  popd
}

${repo}-x86_64-build -c || true
build gjs -i
build gsettings-desktop-schemas -i
build libgweather-gtk4 -i
build evolution-data-server -i
build gnome-settings-daemon -i --nocheck
build libnma -i
build gnome-desktop -i
build gnome-bluetooth -i
build gnome-control-center -i
build gnome-session -i
build mutter -i --nocheck
build gnome-shell -i
build nautilus
build adwaita-icon-theme
build baobab
build gnome-backgrounds
build gnome-disk-utility
build gdm
build gnome-shell-extensions
build gnome-tweaks
build gnome-weather
build gtksourceview5
build sysprof
build totem
build vte3
build xdg-desktop-portal-gnome
