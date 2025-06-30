# Fedora 42 Sway Spin

My dotfiles and startup script for fedora 42 sway spin.

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

# intel stuff. don't paste these if you don't have intel
sudo dnf swap libva-intel-media-driver intel-media-driver --allowerasing
sudo dnf install libva-intel-driver
sudo dnf install -y intel-microcode
```
