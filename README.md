# dotfiles

* [Installation](#installation)

# Installation

macOS

```bash
softwareupdate -i -a
xcode-select --install
```

```bash
source .macos
```

```bash
curl -O https://raw.githubusercontent.com/alexmirkhaydarov/dotfiles/master/bootstrap.sh
chmod +x bootstrap.sh
./bootstrap.sh
```

`zpreztorc` modifications

Add `git` module to `zstyle ':prezto:load' pmodule`
Change theme in `zstyle ':prezto:module:prompt' theme 'sorin'` to `garrett`
