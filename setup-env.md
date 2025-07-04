# How to setup the dev-env on a fresh machine

## Steps:

### 1) Default fedora stuff for better experience:

```bash
# faster downloads
printf "max_parallel_downloads=10\nfastestmirror=true\n" | sudo tee -a /etc/dnf/dnf.conf > /dev/null

sudo dnf update

sudo fwupdmgr refresh --force
sudo fwupdmgr get-devices # Lists devices with available updates.
sudo fwupdmgr get-updates # Fetches list of available updates.
sudo fwupdmgr update

reboot
```

after reboot add rpm, flatpak, fix codecs, fix firefox and add the intel stuff

```bash
# enabling the rpm repositories
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf group upgrade core

# enbale flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-modify --enable flathub

# codecs 
sudo dnf4 group install multimedia
sudo dnf swap 'ffmpeg-free' 'ffmpeg' --allowerasing # Switch to full FFMPEG.
sudo dnf upgrade @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin # Installs gstreamer components. Required if you use Gnome Videos and other dependent applications.
sudo dnf group install -y sound-and-video # Installs useful Sound and Video complementary packages.`

# H/W Video Acceleration
sudo dnf install ffmpeg-libs libva libva-utils

# fix firefox (also remember to add betterfox and enable OpenH264 in firefox)
sudo dnf install -y openh264 gstreamer1-plugin-openh264 mozilla-openh264
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# intel stuff. don't paste these if you don't have intel
sudo dnf swap libva-intel-media-driver intel-media-driver --allowerasing
sudo dnf install libva-intel-driver
```

### 2) Prepare the machine for the setup script

1. setup your default directories:

```bash
mkdir $HOME/repos
cd $HOME/repos
mkdir assembly  bash  c  js_ts  keyboards  python
cd
cd $HOME/.local
mkdir scripts
cd
```

2. add user.js from https://github.com/yokoffing/Betterfox
3. setup your passwords directory
4. install syncthing and setup syncthing:

```bash
sudo dnf install syncthing
sudo systemctl start syncthing@$(whoami)
systemctl --user is-enabled syncthing.service || sudo systemctl enable syncthing@$(whoami)
```

5. install git and password manager `sudo dnf5 install git keepassxc`
6. setup keepassxc
7. sync firefox
8. setup ssh in git in the browser and in keepassxc

### 3) run ./install_libs and ./install_env_libs

### 4) install the configs for the env libs with ./update-env (based on the primeagen's dev-env)
