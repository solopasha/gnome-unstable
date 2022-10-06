#!/usr/bin/env bash
set -eux
repo="${1:-extra}"

if [[ -z "$repo" ]]; then
  echo "Usage: ./build <repo>"
  exit
fi

build() {
  pushd $1
  shift
  sudo /usr/bin/makechrootpkg -r /var/lib/archbuild/${repo}-x86_64/ -- -r --skippgpcheck $@
  popd
}

${repo}-x86_64-build -c || true
build gsettings-desktop-schemas -i
build gcr-4 -i
build geocode-glib-2 -i
build libgweather-4 -i
build gnome-online-accounts -i
build evolution-data-server -i
build gnome-desktop -i
build gnome-session -i
build mutter -i
build gnome-settings-daemon -i
build nautilus -i
build nautilus-python -i
build libnma -i
build gnome-control-center -i
build adwaita-icon-theme -i
build gnome-session -i
build js102 -i
build gjs -i
build sysprof -i
build mutter -i
build gnome-shell -i
build gnome-backgrounds -i
build baobab
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
build gnome-weather
