# Dotfiles for my Fedora 44 KDE setup

Welcome to my dotfiles. Follow the instructions below to clone the repo and stow configuration for various applications. Obvious pre-requisite is installation of `git` and `stow` packages. 

1. Clone repository
   
   ```shell
   git clone https://github.com/lioncahir/fedora.git .dotfiles
   cd .dotfiles
   ```

1. Use GNU stow to create symlinks for selected application (use -v option for verbose output)

    stow -v vim yazi

## Special considerations

- it is recommended to first stow dotfiles and only afterwards install and/or first run the corresponding application. In other words, prepare the config files before first running the app.

