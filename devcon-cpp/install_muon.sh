# Build and install muon

git clone https://git.sr.ht/~lattis/muon
cd muon
meson setup builddir
meson compile -C builddir
meson test -C builddir
sudo meson install -C builddir
