# Setting up NeoVim
sudo apt install python3-pip
sudo apt install python3-venv
python3 -m pip install --user --upgrade pynvim

## After installing NeoVim
:GoInstallBinaries
:COQdep
:TSUpdate go
:TSUpdate vim

# Helpful things to install!

## Start ssh-agent automatically
sudo apt-get install keychain

### Add to bashrc
eval $(keychain --eval id_rsa)
