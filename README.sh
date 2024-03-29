#!/bin/bash
set -ex
#
# wget https://raw.githubusercontent.com/collinbarnwell/bashstuff/master/README.sh
# chmod +x ./README.sh
# ./README.sh
# DO NOT USE SUDO
#

sudo apt-get update -y
sudo apt-get install -y git zsh curl

git config --global alias.co checkout
git config --global alias.st status
git config --global alias.br branch
git config --global alias.ct commit
git config --global alias.rect "commit --amend --no-edit"
git config --global alias.paid 'push -u "(git symbolic-ref --short HEAD)":"cb-$(git symbolic-ref --short HEAD)"'

git clone https://github.com/collinbarnwell/bashstuff.git .bashstuff
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# If zsh still isn't default, may need to edit gnome terminal settings
# https://www.linuxuprising.com/2021/01/how-to-change-default-shell-in-linux.html

echo "source ~/.bashstuff/bashstuff.sh" >> ~/.bashrc
echo "source ~/.bashstuff/bashstuff.sh" >> ~/.zshrc

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# emacs
sudo apt-get install -y build-essential texinfo libx11-dev libxpm-dev libjpeg-dev \
  libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev automake autoconf gnutls-dev
wget http://ftp.wayne.edu/gnu/emacs/emacs-27.2.tar.xz
tar xvf emacs-27.2.tar.xz
cd emacs-27.2
./configure
make
make install
cd ..
rm -rf emacs-27.2
rm emacs-27.2.tar.xz
sudo apt-get install -y ripgrep fd-find

mkdir -p ~/.config/systemd/user/
cat <<EOT >> ~/.config/systemd/user/emacs.service
[Unit]
Description=Emacs text editor
Documentation=info:emacs man:emacs(1) https://gnu.org/software/emacs/

[Service]
Type=forking
ExecStart=/usr/bin/emacs --daemon
ExecStop=/usr/bin/emacsclient --eval "(kill-emacs)"
Environment=SSH_AUTH_SOCK=%t/keyring/ssh
Restart=on-failure

[Install]
WantedBy=default.target
EOT

git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

systemctl enable --user emacs --now
systemctl start --user emacs
