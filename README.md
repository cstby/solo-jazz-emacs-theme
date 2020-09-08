<h3 align="center">Solo Jazz Theme for Emacs</h3>
<hr/>

<p align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/EmacsIcon.svg/120px-EmacsIcon.svg.png" />
</p>

<p align="center">
<a href="https://github.com/cstby/solo-jazz-emacs-theme"><img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" alt="Maintenance"></a>
<a href="https://github.com/cstby/solo-jazz-emacs-theme"><img src="https://img.shields.io/github/release/cstby/solo-jazz-emacs-theme" alt="Version"></a>
<a href="https://www.gnu.org/software/emacs/"><img src="https://img.shields.io/badge/Emacs-26.1%2B-d24b83.svg" alt="Emacs"></a>
<a href="https://www.gnu.org/licenses/gpl-3.0"><img src="https://img.shields.io/badge/License-GPL%20v3-blue.svg" alt="GPL License"></a>
</p>

<br/>

<p align="center">An original theme inspired by the 1992 Solo Jazz cup design.</p>

<br/>

## About

Inspired by the [Jazz](https://en.wikipedia.org/wiki/Jazz_(design)) design, this eye-pleasing theme fits into any modern day work environment while tastefully showcasing a late 20th century aesthetic.

![alt text](./screenshots/solo-jazz-screen-1.png)

## Installation

Download `jazz-theme.el` and put it under `~/.emacs.d/themes/`, then add these lines to your `init.el`:

```emacs-lisp
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'jazz t)
```

## Supported Modes

- avy
- centaur-tabs
- company
- cider
- doom-modeline
- diff
- ediff
- ido
- isearch
- ivy (counsel and projectile)
- keycast
- magit
- lispy
- magit
- markdown
- neotree
- post-tip
- show-paren
- racket
- undo-tree
- web-mode

## Custom colors

You can change the theme's base colors by defining them in the `solo-jazz-override-colors-alist`variable. You must define this variable before loading the theme. For example:

```elisp
(setq solo-jazz-override-colors-alist
      '(("solo-jazz-black" . "#000000")
	    ("solo-jazz-white" . "#ffffff")))
	  
(load-theme 'solo-jazz t)
```

## Contributing

Please feel free to send a GitHub pull request to add support for your favorite packages. If you find any bugs or problems, please report them in the issue tracker. I welcome contributions of any kind.

## License

Distributed under the GNU General Public License, version 3.
