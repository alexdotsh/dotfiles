# dotfiles

* [Installation](#installation)

# Installation

macOS

```bash
softwareupdate -i -a

xcode-select --install
```

```bash
curl https://raw.githubusercontent.com/alexmirkhaydarov/dotfiles/main/init --output "${HOME}/init" && \
chmod +x "${HOME}/init" && "${HOME}/init"
```
