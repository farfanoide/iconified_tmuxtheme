Iconified Tmux Theme
====================

Tmux theme designed to show as many icons as possible, because you can never
have to many of those!

Screenshots:
------------

![screenshot](https://www.dropbox.com/s/ia3afhrfsylmrnx/iconified_dark.png?dl=1)

More details about features, predefined segments and screenshots can be found at
the [wiki][] page.

Requirements:
-------------

- [Nerd Fonts][nerd_fonts] are required to have basic icons
- [Wi Fi script][wifi_script]
- [Battery script][wifi_script]

Both Battery and Wi Fi scripts can be any one you like, just make sure they are
in your `$PATH` and they are called `battery` and `wifi_network` respectively.

Manual Installation:
--------------------

- Clone repo to local machine:

```bash
git clone https://github.com/farfanoide/iconified_tmuxtheme ~/.iconified_tmuxtheme
```

- Source desired flavour in your `~/.tmux.conf`:

```tmux
source-file "${HOME}/.iconified_tmuxtheme/iconified_dark.tmuxtheme"
```


Using [Tmux Plugin Manager][tpm]:
---------------------------------

- Add plugin to the list of TPM plugins in `.tmux.conf` and install it with
 `prefix + I`:

```
set -g @plugin 'farfanoide/iconified_tmuxtheme'
```

- Set the desired flavour in your `~/tmux.conf` (dark is default):

 ```tmux
set -g @iconified 'light'
 ```


[tpm]: https://github.com/tmux-plugins/tpm
[nerd_fonts]: https://github.com/ryanoasis/nerd-fonts
[battery_script]: https://github.com/farfanoide/dotfiles/blob/master/bin/battery
[wifi_script]: https://github.com/farfanoide/dotfiles/blob/master/bin/wifi_network
[wiki]: https://github.com/farfanoide/iconified_tmuxtheme/wiki/Features-and-Screenshots
