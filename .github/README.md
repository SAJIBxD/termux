<!-- SETUP -->
## :wrench: <samp>SETUP</samp>

   First of all, this repository contains submodules. Ensure they are updated before installing.

   > Make sure to have [Git](https://git-scm.com/) installed.
   ```sh
    $ git clone --recurse-submodules https://github.com/hossainrizbi/termux.git ~/dotfiles
    $ cd dotfiles && git submodule update --remote --merge
   ```
   Now you can manually move them to config location or use [rsync](https://rsync.samba.org)
   ```sh
    $ rsync --recursive --verbose --exclude=.git* ~/dotfiles/ $HOME/
   ```
   Or 
   ```sh
   $ sh -c ($curl -fsSL https://raw.githubusercontent.com/SAJIBxD/termux/refs/heads/main/setup.sh)
   ```
