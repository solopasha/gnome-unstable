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
  /usr/bin/makechrootpkg -r /var/lib/archbuild/${repo}-x86_64/ -U builduser -- -r --skippgpcheck $@
  popd
}

${repo}-x86_64-build -c || true
build gsettings-desktop-schemas -i
build template-glib -i
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
build malcontent -i
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
build grilo -i
build grilo-plugins -i
build totem
build gnome-disk-utility
build file-roller
build gedit
build xdg-desktop-portal-gnome
build gnome-shell-extensions
build gnome-weather
build libshumate -i
build gnome-maps
build libgda6 -i
build libosinfo -i
build libpanel -i
build libpeas -i
build callaudiod -i
build feedbackd -i
build cheese
build clapper
build d-spy
build eog
build epiphany
build evince
build evolution
build gdm
build geary
build gnome-boxes
build gnome-builder
build gnome-calendar
build gnome-calls
build gnome-characters
build gnome-clocks
build gnome-connections
build gnome-console
build gnome-contacts
build gnome-endeavour
build gnome-font-viewer
build gnome-initial-setup
build gnome-logs
build gnome-photos
build gnome-podcasts
build gnome-power-manager
build gnome-remote-desktop
build gnome-software
build gnome-sound-recorder
build gnome-text-editor
build gnome-tour
build gnome-user-docs
build mutter-dynamic-buffering
build newsflash
build orca
build phodav
build sofia-sip
build spice-gtk

