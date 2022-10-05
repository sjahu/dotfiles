#!/bin/zsh

# Stephen Humphries
# ZSH Config

#############
### Shell ###
#############
bindkey -e # emacs bindings (e.g. Ctrl-a, Ctrl-e)
bindkey "\e[3~" delete-char

##############
### Prompt ###
##############
set -o PROMPT_SUBST
PS1='%F{cyan}%1~%f$(git_branch_prompt) %F{white}%#%f '

function git_branch_prompt {
  GIT_BRANCH="$(git symbolic-ref --short HEAD 2>/dev/null)"
  if [[ -n "${GIT_BRANCH}" ]]; then
    echo " (%F{red}${GIT_BRANCH}%f)"
  fi
}

###################
### Environment ###
###################
if [ "$(uname)" = "Darwin" ]; then
  PATH="${PATH}:/Users/$(whoami)/bin"
else
  PATH="${PATH}:/home/$(whoami)/bin"
fi
export EDITOR="vim"
export BUNDLER_EDITOR="code"

###############
### Aliases ###
###############

# cd
alias ..="cd .."
alias ~="cd ~"

# ls
if [ "$(uname)" = "Darwin" ]; then
  alias ls="ls -G" # enable colours
else
  alias ls="ls --color"
fi
alias ll="ls -al"

# git
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gb="git branch"
alias gl="git log"
function gd { git diff --color=always "$@" | less -r }
alias gco="git checkout"
alias gcm='git checkout $(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@")'
alias gps="git push --force-with-lease --force-if-includes"
alias gpl="git pull && git remote set-head origin --auto"
alias gbclean="git branch | grep -v \"^*\" | xargs git branch -D"
alias gr="git rebase"

# tmux
alias t="tmux"
alias c="tmux save-buffer - | pbcopy && echo 'Saved tmux buffer to clipboard'"

# sudo
if [ "$(uname)" = "Linux" ]; then
  alias pacman="sudo pacman"
  alias systemctl="sudo systemctl"
fi
alias reboot="sudo reboot"
alias halt="sudo halt"

