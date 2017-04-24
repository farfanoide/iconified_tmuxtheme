Iconified Tmux Theme
====================

Tmux theme designed to show as many icons as possible, because you can never
have to many of those!

Screenshots (more in the [wiki][] page):
----------------------------------------

![screenshot](https://www.dropbox.com/s/ia3afhrfsylmrnx/iconified_dark.png?dl=1)

More details about features, predefined segments and screenshots can be found in
the [wiki][] page.

Requirements:
-------------

- [Nerd Fonts][nerd_fonts] are required to have basic icons
- [Wi Fi script][wifi_script]
- [Battery script][battery_script]

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

```tmux
set -g @plugin 'farfanoide/iconified_tmuxtheme'
```

- Set the desired flavour in your `~/tmux.conf`:

 ```tmux
set -g @iconified_flavour 'dark'
 ```

> Note that iconified does not load itself by default, so you must set the
> desired flavour in order for it to work. This is to prevent the theme from
> automatically loading when the user might want to try another one.

Configuration:
--------------

If you installed it using tpm, there are some (still very basic) configuration
options available, more will come in the future:

| configuration option        | changes                                                              |
| ---------------------       | --------                                                             |
| @iconified_session_icon     | icon on session segment at start of left status bar                  |
| @iconified_time_icon        | icon prepended to time segment                                       |
| @iconified_prefix_sent_icon | icon to show when tmux prefix has been sent                          |
| @iconified_prefix_icon      | icon when tmux prefix has not been sent (basically most of the time) |
| @iconified_wifi_script      | name of the wifi script to execute                                   |
| @iconified_battery_script   | name of the battery script to execute                                |
| @iconified_hostname_icon    | icon to show next to hostname                                        |
| @iconified_clients_icon     | icon to show next to amount of clients attached to session           |

To use them just set the required option on your `~/.tmux.conf`.

```tmux
# Example to change session icon:
set -g @iconified_session_icon '[]'
```

Left and right status bar might be completely changed configured like so:

```tmux
set -g @iconified_status_left '#S'
set -g @iconified_status_right '#h'
```


[tpm]: https://github.com/tmux-plugins/tpm
[nerd_fonts]: https://github.com/ryanoasis/nerd-fonts
[battery_script]: https://github.com/farfanoide/dotfiles/blob/master/bin/battery
[wifi_script]: https://github.com/farfanoide/dotfiles/blob/master/bin/wifi_network
[wiki]: https://github.com/farfanoide/iconified_tmuxtheme/wiki/Features-and-Screenshots
