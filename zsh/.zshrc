# history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# binds
bindkey -e
bindkey '^[[A' up-line-or-beginning-search   # Up arrow
bindkey '^[[B' down-line-or-beginning-search # Down arrow

# completion
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion
_comp_options+=(globdots) # include hidden files

# fastfetch script
# if [ -z $WAYLAND_DISPLAY ]; then
# 	fastfetch -l none
# else
# 	fastfetch
# fi

# some useful options
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef # disable ctrl-s to freeze terminal
zle_highlight=('paste:none')

# prompt
eval "$(starship init zsh)"
# add new lines between commands
PROMPT_NEEDS_NEWLINE=false
precmd() {
  if [[ "$PROMPT_NEEDS_NEWLINE" == true ]]; then
    echo
  fi
  PROMPT_NEEDS_NEWLINE=true
}
clear() {
  PROMPT_NEEDS_NEWLINE=false
  command clear
}
