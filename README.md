# Setting up NeoVim

`brew install neovim`

## After installing NeoVim

Copy the `nvim` dir to `~/.config/nvim/`

## Helpful things to install

For debugging Zig and Go inside nvim:

```
brew install llvm
brew install delve
```

For better find / search support:

- `brew install fd` - better find in terminal
- `brew install fzf` - fast fuzzy finder in terminal
- `brew install rg` - live grep with ripgrep

### Start ssh-agent automatically

`sudo apt-get install keychain`

### Add to bashrc

`eval $(keychain --eval id_rsa)`
