#!/bin/zsh

# Stephen Humphries
# ZSH Config

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
PATH="${PATH}:/Users/$(whoami)/bin/"
EDITOR="vim"

###############
### Aliases ###
###############

# cd
alias ..="cd .."
alias ~="cd ~"

# ls
alias ls="ls -G" # enable colours
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
alias gps="git push"
alias gpl="git pull && git remote set-head origin --auto"
alias gbclean="git branch | grep -v \"^*\" | xargs git branch -D"
alias gr="git rebase"

# tmux
alias t="tmux"
alias c="tmux save-buffer - | pbcopy && echo 'Saved tmux buffer to clipboard'"
