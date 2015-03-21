# mydotfiles

## Installation

Via `curl`:

```bash
curl -L https://raw.github.com/akiray03/mydotfiles/master/script/install.sh | bash
```

## Sync

```bash
dotfiles-sync
```

## Provisioning

### AppStore

 - 1Password
 - Microsoft Remote Desktop
 - Xcode
 - and more..
   - Keynote, Pages, Numbers, LINE, ...

### Official Site

 - https://www.dropbox.com/
 - https://www.google.co.jp/chrome/browser/desktop/
 - https://www.mozilla.org/ja/firefox/new/
 - https://www.google.co.jp/ime/
 - http://www.prolific.com.tw/US/ShowProduct.aspx?p_id=229&pcid=41 (PL2303)
 - http://bjango.com/mac/istatmenus/

### brew

```bash
sudo xcodebuild -license
xcode-select --install

~/.mydotfiles/provision/base.sh

brew doctor
brew update

~/.mydotfiles/provision/brew-packages.sh
~/.mydotfiles/provision/rbenv.sh
~/.mydotfiles/provision/vimbundle.sh
```

### change default shell

```bash
$ sudo vim /etc/shells
  ## -> add /usr/local/bin/zsh
$ chsh
  ## -> change shell
```
