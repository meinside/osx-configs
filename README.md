# My dotfiles for OSX #

by Sungjin Han <meinside@gmail.com>

----

## DESCRIPTION

My personal dotfiles for OSX, mostly for development.

**NOTE: these files are being maintained [here](https://github.com/meinside/dotfiles) since _2020-02-03_.**

----

## How-to

### Prep script

Run **bin/prep.sh** and it will clone files and install several things automatically.

```bash
$ cd ~
$ wget -O - "https://raw.githubusercontent.com/meinside/osx-configs/master/bin/prep.sh" | bash
```

=> will install **Homebrew**

### Setup paths

Reorder paths in **/etc/paths** for convenience:

``$ sudo vi /etc/paths``

=> put **/usr/local/bin** on the top for Homebrew

```
/usr/local/bin
/usr/bin
/bin
/usr/sbin
/sbin
```

----

## Memo

### How to remove unused Xcode simulators

```bash
$ xcrun simctl delete unavailable
```

