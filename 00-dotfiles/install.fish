#!/usr/bin/env fish
set -Ux EDITOR micro
set -Ux VISUAL $EDITOR
set -Ux WEDITOR code

set -Ux DOTFILES ~/.dotfiles
set -Ux PROJECTS ~/Code

set -Ua fish_user_paths $DOTFILES/bin $HOME/.bin
set -U fish_user_paths /opt/homebrew/bin/ $fish_user_paths

for f in $DOTFILES/*/functions
	set -Up fish_function_path $f
end

for f in $DOTFILES/*/conf.d/*.fish
	ln -sf $f ~/.config/fish/conf.d/(basename $f)
end

if test -f ~/.localrc.fish
	ln -sf ~/.localrc.fish ~/.config/fish/conf.d/localrc.fish
end
