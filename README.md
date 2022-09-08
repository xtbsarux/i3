## Prerequisites
### i3-gaps

```sh
git clone git@github.com:maestrogerardo/i3-gaps-deb.git
cd i3-gaps-deb
./i3-gaps-deb
# Follow the interactive prompts.
```
### i3-gaps (alternatively)

* i3-gaps (Dependencies)
```sh
  sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake
  ```
* i3-gaps (Build)
```sh
cd tmp
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
```
### Dependencies
* feh picom rofi polybar zsh
```sh
sudo apt install feh picom rofi polybar zsh
```
* pywal
```sh
git clone https://github.com/dylanaraps/pywal
cd pywal
pip3 install --user .

# Add local 'pip' to PATH:
# (In your .bashrc, .zshrc etc)
export PATH="${PATH}:${HOME}/.local/bin/"
```

* [feh](https://github.com/derf/feh)
* [picom](https://github.com/yshui/picom)
* [rofi](https://github.com/davatorium/rofi)
* [polybar](https://github.com/polybar/polybar)
* [pywal](https://github.com/dylanaraps/pywal)
* zsh - Shell

### Installation

1. Clone the repo

   ```sh
   git clone https://github.com/xtbsarux/i3.git
   ```
2. Copy all files to your home directory
3. Add your user to video group
  ```sh
  usermod -aG video username
  ```
4. Create new file **/etc/udev/rules.d/backlight.rules**
  ```sh
  RUN+="/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"
  RUN+="/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"
  ```

<!-- TODO -->
## TODO

- [ ] Add Fonts

  - [ ] for polybar
  
  - [ ] for .zsh

- [ ] Check if everything works on new machine
