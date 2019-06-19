export ZSH="/home/pprabesh/.oh-my-zsh"

ZSH_THEME="ys"

plugins=(
    git yarn vi-mode docker docker-compose zsh_reload
    fancy-ctrl-z shrink-path wd

    # External plugins
    zsh-syntax-highlighting  # https://github.com/zsh-users/zsh-syntax-highlighting
    zsh-autosuggestions      # https://github.com/zsh-users/zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# History Configuration
HISTSIZE=10000000
SAVEHIST=10000000

setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

export EDITOR=vim
export VISUAL="vim"

# this would bind ctrl + space to accept the current suggestion.
bindkey '^ ' autosuggest-accept

alias python=python3
alias tmux="TERM=screen-256color-bce tmux"
alias ssh='TERM=screen ssh'
alias day="base16_gruvbox-light-hard"
alias night="base16_gruvbox-dark-hard"

############ Custom Addon  ############

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

[ -f ~/.fzf.zsh  ] && source ~/.fzf.zsh

# fzf + rg configuration
if _has fzf && _has rg; then
  export FZF_DEFAULT_IGNORE_FOLDERS='"!{**/.git,**/node_modules,**/coverage,.cache,*vim/plugged,*vim/tmp,**/.tox}/*"'
  export FZF_DEFAULT_IGNORE_FILES='"!*{.pyc}"'
  export FZF_DEFAULT_COMMAND="rg -i --files --no-ignore --follow --hidden -g $FZF_DEFAULT_IGNORE_FILES -g $FZF_DEFAULT_IGNORE_FOLDERS 2> /dev/null"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi

