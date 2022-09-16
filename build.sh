#!/usr/bin/env bash
set -eux
repo=$1

if [[ -z "$repo" ]]; then
  echo "Usage: ./build <repo>"
  exit
fi

build() {
  pushd $1
  shift
  sudo makechrootpkg -r /var/lib/archbuild/${repo}-x86_64/ -- -r --skippgpcheck $@
  popd
}

${repo}-x86_64-build -c || true
build glib2 -i
build gobject-introspection -i
build at-spi2-core -i
build gsettings-desktop-schemas -i
build glib-networking -i
build libsoup3 -i
build gcr-4 -i
build geocode-glib-2 -i
build libgweather-4 -i
#build webkit2gtk-4.1 -i
build librest -i
build gnome-online-accounts -i
build evolution-data-server -i
build gnome-desktop -i
build geocode-glib-2 -i
build gnome-settings-daemon -i 
build tracker3 -i
build tracker3-miners -i
build nautilus -i
build nautilus-python -i
build libnma -i
build gnome-control-center -i
build adwaita-icon-theme -i
build gnome-session -i
build gdm -i
build gjs -i
build sysprof -i
build mutter -i
build gnome-shell -i
build gnome-backgrounds -i
build baobab
build gtksourceview5 -i
build gnome-calculator
build vte3 -i
build gnome-terminal
build sushi -i
build totem
build gnome-disk-utility
build file-roller
build gedit
build xdg-desktop-portal-gnome
build gnome-shell-extensions
build gnome-shell-extension-appindicator
build gnome-weather

